tableextension 123456703 "CSD Res. Jnl. Line Ext" extends "Res. Journal Line"
//extending to support Seminar Module
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