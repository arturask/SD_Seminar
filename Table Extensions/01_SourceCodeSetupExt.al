tableextension 123456701 "CSD Source Code Setup Ext" extends "Source Code Setup"
//Adding new field to Source Code Setup to support the Seminar Module
{
    fields
    {
        field(123456700;"CSD Seminar";Code[10])
        {
            Caption = 'Seminar';
            TableRelation = "Source Code";
        }
    }
    
    var
        myInt : Integer;
}