pageextension 123456702 "CSD Source Code Setup Ext" extends "Source Code Setup"
//Added field "Seminar"

{
    layout
    {
        addafter("Cost Accounting")
        {
            group(SeminarGroup)
            {
                Caption = 'Seminar';
            }
        }
        addafter(SeminarGroup)
        {
            field(Seminar;"CSD Seminar")
            {
                Caption = 'Seminar';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    
}