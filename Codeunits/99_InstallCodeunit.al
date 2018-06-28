codeunit 123456799 "CSD Install Codeunit"
{
    Subtype = Install;
    trigger OnRun();
    begin
        
    end;
    
    trigger OnInstallAppPerCompany();
    begin
        CreateNoSeries('SEM');
        CreateNoSeries('SEMREG');
        CreateNoSeries('SEMPREG');
        InitSeminarSetup();
        CreateSeminar();
        CreateResource();
    end;
    local procedure CreateNoSeries(SeriesCode:Code[10]);
    var
        NoSeries:Record 308;
        NoSeriesLines:Record 309;
    begin
        if not NoSeries.Get(SeriesCode) then begin
            Clear(NoSeries);
            NoSeries.Code := SeriesCode;
            NoSeries.Description := SeriesCode + ' No. Series';
            NoSeries."Manual Nos." := true;
            NoSeries."Default Nos." := true;
            NoSeries.Insert(true);
            Clear(NoSeriesLines);
            NoSeriesLines.SetRange("Series Code", NoSeries.Code);
            if not NoSeriesLines.FindSet then begin
                Clear(NoSeriesLines);
                NoSeriesLines."Series Code" := NoSeries.Code;
                NoSeriesLines."Line No." := 10000;
                NoSeriesLines."Starting Date" := DMY2Date(1,1,2018);
                NoSeriesLines."Starting No." := SeriesCode + '000';
                NoSeriesLines."Ending No." := SeriesCode + '999';
                NoSeriesLines.Insert(true);
            end;
        end;
    end;
    
    local procedure InitSeminarSetup();
    var
        SeminarSetup:Record "CSD Seminar Setup";
    begin
        if not SeminarSetup.Get then begin
            SeminarSetup.Init;
            SeminarSetup."Seminar Nos." := 'SEM';
            SeminarSetup."Seminar Registration Nos." := 'SEMREG';
            SeminarSetup."Posted Seminar Reg. Nos." := 'SEMPREG';
            SeminarSetup.Insert;
        end;
    end;

    local procedure CreateSeminar();
    var
        Seminar:Record "CSD Seminar";
    begin
        Clear(Seminar);
        Seminar.Init;
        Seminar."No." := '80437';
        Seminar.validate(Name, 'Solution Development');
        Seminar."Seminar Duration" := 5;
        Seminar."Minimum Participants" := 4;
        Seminar."Maximum Participants" := 12;
        Seminar."Last Date Modified" := DMY2Date(15,2,2018);
        Seminar."Gen. Prod. Posting Group" := 'MISC';
        Seminar."VAT Prod. Posting Group" := 'VAT20';
        Seminar."Seminar Price" := 5000;
        Seminar."No. Series" := 'SEM';
        if Seminar.Insert(true) then;
    end;
    
    local procedure CreateResource();
    var
        Resource:Record Resource;
    begin
        if not Resource.Get('ROOM 01') then begin
            Clear(Resource);
            Resource.Init;
            Resource."No." := 'ROOM 01';
            Resource.validate(Name, 'Room 01');
            Resource.Type := Resource.Type::Machine;
            Resource."Base Unit of Measure" :=  'HOUR';
            Resource."CSD Resource Type" := Resource."CSD Resource Type"::Internal;
            Resource."CSD Quantity Per Day" := 8;
            Resource."CSD Maximum Participants" := 12;
            Resource."Gen. Prod. Posting Group" := 'MISC';
            Resource."VAT Prod. Posting Group" := 'VAT20';
            if Resource.Insert(true) then;
        end;

    end;
}