pageextension 123456701 "CSD Resource List Ext" extends "Resource List"
//Documention - LAB 5.1
{
    layout
    {
        addafter(Type)
        {
            field("CSD Resource Type";"CSD Resource Type")
            {

            }
            
            field("CSD Maximum Participants";"CSD Maximum Participants")
            {
                Visible = ShowMaxField;
            }
        }
        modify(Type)
        {
            Visible = ShowTypeField;
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    
    trigger OnOpenPage();
    begin
        FilterGroup(3);
        ShowMaxField := (GetFilter(Type) = format(Type::Machine));
        ShowTypeField := (GetFilter(Type) = '');
        FilterGroup(0);
    end;

    var
        [inDataSet]
        ShowMaxField: Boolean;
        [inDataSet]
        ShowTypeField: Boolean;
}