CREATE OR REPLACE PACKAGE RGM AS
ma_khraj_had Exception  ;
FUNCTION number_of_renters RETURN NUMBER;
PROCEDURE number_of_occupied_apparetments;
PROCEDURE number_of_occupied_apparetments_by_residential_group;
FUNCTION number_of_complaints RETURN NUMBER;
FUNCTION Income(rgn) RETURN NUMBER;
FUNCTION number_of_potential_renters RETURN NUMBER;
PROCEDURE Detailed_info_of_potentials;
PROCEDURE Detailed_info_of_leavers;
PROCEDURE Detailed_info_of_conversion;
PROCEDURE Kalleba;
PROCEDURE li_kharjou;

END RGM;

CREATE OR REPLACE PACKAGE BODY RGM AS
FUNCTION number_of_renters 
RETURN NUMBER
IS
num NUMBER(8,2):=0;
BEGIN
SELECT COUNT(renter_name)
INTO num
FROM renter,appartment
WHERE renter.renter_id=appartment.RENTER_ID AND appartment.available=0;
RETURN(num);
END number_of_renters;
PROCEDURE number_of_occupied_apparetments
IS
BEGIN
DECLARE
CURSOR C3 IS 
SELECT Residential_GROUP_name ||' block:'|| appartment_block AS "Residence:Block" ,COUNT(appartment_ID)
FROM appartment,residential_group
WHERE residential_group.Residential_GROUP_ID=appartment.Residential_GROUP_ID and appartment.available=0
GROUP BY appartment_block , Residential_GROUP_name
ORDER BY "Residence:Block";
V_name varchar(500);
V_num int;
BEGIN
OPEN C3;
LOOP
FETCH C3 INTO v_name, V_num;
EXIT WHEN C3%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(v_name || V_num);
END LOOP;
CLOSE C3;
END;
END number_of_occupied_apparetments;
PROCEDURE number_of_occupied_apparetments_by_residential_group
IS
BEGIN
DECLARE
CURSOR C8 IS 
SELECT residential_group_name,count(appartment_id)
from appartment,residential_group
where available=0 and residential_group.residential_group_id=appartment.residential_group_id
group by  residential_group_name;
V_name varchar(500);
V_num int;
BEGIN
OPEN C8;
LOOP
FETCH C8 INTO v_name, V_num;
EXIT WHEN C8%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(v_name || V_num);
END LOOP;
CLOSE C8;
END;
END number_of_occupied_apparetments_by_residential_group;
FUNCTION number_of_complaints 
RETURN NUMBER
IS
num NUMBER(8,2):=0;
BEGIN
SELECT COUNT(complaint)
INTO num
FROM complaint;
RETURN(num);
END number_of_complaints;
FUNCTION Income(rgn IN residential_group.residential_group_name%TYPE)  
RETURN NUMBER
IS
num NUMBER(8,2):=0;
BEGIN
SELECT SUM(amount)
INTO num
FROM payment JOIN residential_group JOIN appartment 
ON residential_group.residential_group_ID=appartment.residential_group_ID
AND appartment.renter_ID=payment.renter_ID
WHERE PoN=1 AND residential_group_name=rgn ;
RETURN(num);
END Income;
FUNCTION number_of_potential_renters 
RETURN NUMBER
IS
num NUMBER(8,2):=0;
BEGIN
SELECT COUNT(POTENTIAL_RENTER_NAME)
INTO num
FROM POTENTIAL_RENTER;
RETURN(num);
END number_of_potential_renters;
PROCEDURE Detailed_info_of_potentials
IS
BEGIN
DECLARE
TYPE r_potential IS RECORD 
(V_name potential_renter.Potential_renter_name%TYPE,
V_mail potential_renter.Potential_renter_email%TYPE,
V_num potential_renter.Number_of_App_visited%TYPE);
Potential_renter_info r_potential;
CURSOR C1 IS 
SELECT Potential_renter_name ,Potential_renter_email,Number_of_App_visited 
FROM potential_renter
ORDER BY Number_of_App_visited DESC;

BEGIN
OPEN C1;
LOOP
FETCH C1 INTO Potential_renter_info;
EXIT WHEN C1%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(Potential_renter_info.v_name||Potential_renter_info.v_mail||Potential_renter_info.v_num);
END LOOP;
CLOSE C1;
END;
END Detailed_info_of_potentials;
PROCEDURE Detailed_info_of_leavers
IS
BEGIN
DECLARE
CURSOR C2 IS
SELECT renter_name 
FROM renter
WHERE renter.renter_ID NOT IN (
SELECT DISTINCT(renter_ID)
FROM appartment 
WHERE appartment.RENTER_ID IS NOT NULL);
V_name renter.renter_name%TYPE;
BEGIN
OPEN C2;
LOOP
FETCH C2 INTO v_name;
EXIT WHEN C2%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('name: ' || v_name);
END LOOP;
CLOSE C2;
END;
END Detailed_info_of_leavers;
PROCEDURE Detailed_info_of_conversion
IS
BEGIN
DECLARE
CURSOR C7 IS
SELECT DISTINCT(renter.renter_name)
FROM renter,complaint,appartment
WHERE renter.renter_id=complaint.renter_id AND renter.renter_id NOT IN 
(SELECT RENTER_ID FROM appartment WHERE appartment.renter_id IS NOT NULL );
V_name renter.renter_name%TYPE;
BEGIN
OPEN C7;
LOOP
FETCH C7 INTO v_name;
EXIT WHEN C7%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('name: ' || v_name);
END LOOP;
CLOSE C7;
END;
END Detailed_info_of_conversion;
PROCEDURE Kalleba
IS
BEGIN
DECLARE
CURSOR C4 IS
SELECT renter_name,renter_phone,payment.AMOUNT
FROM payment JOIN renter ON renter.renter_id=payment.renter_id
WHERE payment.PoN=0;
V_name renter.renter_name%TYPE;
V_phone renter.renter_phone%TYPE;
V_amount payment.amount%TYPE;
BEGIN
OPEN C4;
LOOP
FETCH C4 INTO v_name,v_phone,v_amount;
EXIT WHEN C4%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('name: ' || v_name || v_phone ||'     Amount they owe: '|| v_amount ||'TND');
END LOOP;
CLOSE C4;
END;
END Kalleba;
PROCEDURE li_kharjou
IS 
oldy INT ;
newy INT ;
BEGIN
SELECT COUNT(renter_ID)
INTO oldy
FROM renter ;
DELETE FROM renter
WHERE renter.renter_ID NOT IN ( SELECT appartment.renter_ID FROM appartment,payment WHERE (appartment.renter_ID IS NOT NULL) AND PoN=0);
SELECT COUNT(renter_ID)
INTO newy
FROM renter ;
IF oldy-newy=0 THEN RAISE RGM.ma_khraj_had; END IF;
EXCEPTION
WHEN RGM.ma_khraj_had THEN DBMS_OUTPUT.PUT_LINE('No one is going out this month');
END li_kharjou;

END RGM;

CREATE OR REPLACE TRIGGER chkoun_khraj
AFTER DELETE ON renter 
FOR EACH ROW
BEGIN
DBMS_OUTPUT.PUT_LINE('The renter '|| :OLD.renter_name || ' left this month.');
END chkoun_khraj;