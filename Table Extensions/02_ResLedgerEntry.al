tableextension 123456702 "CSD Res. Ledger Entry Ext" extends "Res. Ledger Entry"
//adding new fields to better support Seminar Module
{
    fields
    {
        field(123456700;"CSD Seminar No.";Code[20])
        {
            TableRelation = "CSD Seminar";
        }
        field(123456701;"CSD Seminar Registration No.";Code[20])
        {
            TableRelation = "CSD Seminar Reg. Header";
        }
    }

}