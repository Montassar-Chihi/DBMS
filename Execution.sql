VARIABLE number_of_renters NUMBER;
EXECUTE :number_of_renters:=RGM.number_of_renters();
PRINT number_of_renters;

EXECUTE RGM.number_of_occupied_apparetments;

EXECUTE RGM.number_of_occupied_apparetments_by_residential_group;

VARIABLE number_of_complaints NUMBER;
EXECUTE :number_of_complaints:=RGM.number_of_complaints();
PRINT number_of_complaints;

VARIABLE INCOME NUMBER;
EXECUTE :INCOME:=RGM.INCOME('Mrezgua Residence');
PRINT INCOME;

VARIABLE number_of_potential_renters NUMBER;
EXECUTE :number_of_potential_renters:=RGM.number_of_potential_renters();
PRINT number_of_potential_renters;
 
EXECUTE RGM.Detailed_info_of_potentials;

EXECUTE RGM.Detailed_info_of_leavers;

EXECUTE RGM.Detailed_info_of_conversion;

EXECUTE RGM.kalleba;

/*EXECUTE RGM.li_kharjou;*/ /*this procedure deletes the renters that left from this database but 
don't do it until the analysis on power bi is done*/