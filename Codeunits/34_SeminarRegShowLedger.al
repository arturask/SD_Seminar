codeunit 123456734 "CSD Seminar Reg.-Show Ledger"
//some documentation. Seriously, the book is attached to these...
{
    TableNo = "CSD Seminar Register";
    trigger OnRun();
    begin
        SeminarLedgerEntry.SetRange("Entry No.", Rec."From Entry No.", Rec."To Entry No.");
        Page.Run(Page::"CSD Seminar Ledger Entries", SeminarLedgerEntry);
    end;
    
    var
        SeminarLedgerEntry:Record "CSD Seminar Ledger Entry";
}