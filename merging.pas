program merging;
uses listsProcLib;
var
        fText1, fText2: text;
        f1, f2, f: intFile;
        tmp: integer;

begin
        assign(fText1,'../pascal-sources/A.txt');
        assign(fText2,'../pascal-sources/B.txt');

        assign(f1,'../pascal-sources/A_DAT.dat');
        assign(f2,'../pascal-sources/B_DAT.dat');
        assign(f,'../pascal-sources/mergingAB.dat');

        reset(fText1);
        reset(fText2);

        rewrite(f1);
        rewrite(f2);
        rewrite(f);

        initDatFile(fText1,f1);
        initDatFile(fText2,f2);

        seek(f1,0);
        seek(f2,0);

        writeln('?ÖrõùÖå,  _"† Æ"†ç Æ"  --âù õ .dat Ñ cÆâ.');
        writeln('A:');
        showDatFileInfo(f1);
        writeln('B:');
        showDatFileInfo(f2);

        mergingLists(f1,f2,f);

        writeln('?ÖrõùÖå ÖùaÆçÉ É †rÖÉ"Örõ¶": ');
        showDatFileInfo(f);

        close(fText1);
        close(fText2);
        close(f1);
        close(f2);
        close(f);
        readln;
end.


