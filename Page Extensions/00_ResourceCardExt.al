pageextension 123456700 "CSD Resource Card Ext" extends "Resource Card"
//Documention - LAB 5.1
{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type";"CSD Resource Type")
            {

            }
            
            field("CSD Quantity Per Day";"CSD Quantity Per Day")
            {
                
            }
            
        }
        addafter("Personal Data")
        {
            group("CSD Room")
            {
                Caption = 'Room';
                Visible = ShowMaxField;
                field("CSD Maximum Participants";"CSD Maximum Participants")
                {
                    
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    
    trigger OnAfterGetRecord();
    begin
        ShowMaxField := (Type = Type::Machine);
        CurrPage.Update(false);
    end;

    var
        [inDataSet]
        ShowMaxField: Boolean;
}