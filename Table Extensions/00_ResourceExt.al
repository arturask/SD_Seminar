tableextension 123456700 "CSD Resource Extension" extends Resource
//Lab 5.1
{
    fields
    {
        field(123456700;"CSD Resource Type";Option)
        {
            Caption = 'Resource Type';
            OptionMembers = "Internal", "External";
            OptionCaption = 'Internal,External';
        }
        field(123456701;"CSD Maximum Participants";Integer)
        {
            Caption = 'Maximum Participants';
        }
        field(123456702;"CSD Quantity Per Day";Integer)
        {
            Caption = 'Quantity Per Day';
        }
    }
    
}