%Análisis difuso global del balanced scorecard financiero.
%Una empresa tiene 4 indicadores básicos, a saber:
%Perspectiva financiera
%Perspectiva cliente
%Perpectiva desarrollo
%Perspectiva proceso.

%tres sistemas de inferencia difuso
%el primero es influencia perspectiva
influencia=readfis('influenciaperspectiva');
%el segundo es el logro de la perspectiva
logro=readfis('logroperspectiva');
%el tercero es la evaluación balanceada
bscd=readfis('balancedscorecard');

%% primera parte: Evaluación de expertos
%cada experto da una evaluación de cada indicador, así que, por perspectiva
NI=0;PI=25;I=50;MI=75;V=100;

experto1.cliente=[I I PI MI];
experto1.proc=[MI I I I];
experto1.desa=[I I PI PI];
experto1.fina=[I I MI MI];

experto2.cliente=[V MI I MI];
experto2.proc=[I I PI MI];
experto2.desa=[I I PI PI];
experto2.fina=[I I PI PI];

experto3.cliente=[MI MI MI MI];
experto3.proc=[I MI I MI];
experto3.desa=[MI MI MI MI];
experto3.fina=[V MI I PI];

experto4.cliente=[MI I I I];
experto4.proc=[I I MI I];
experto4.desa=[I MI PI PI];
experto4.fina=[V I MI V];

experto5.cliente=[V I MI MI];
experto5.proc=[I MI I MI];
experto5.desa=[PI I PI PI];
experto5.fina=[PI I V MI];
%se obtiene la influencia propuesta de cada perspectiva por experto

experto1.inflcliente=evalfis(experto1.cliente,influencia);
experto2.inflcliente=evalfis(experto2.cliente,influencia);
experto3.inflcliente=evalfis(experto3.cliente,influencia);
experto4.inflcliente=evalfis(experto4.cliente,influencia);
experto5.inflcliente=evalfis(experto5.cliente,influencia);

experto1.inflproc=evalfis(experto1.proc,influencia);
experto2.inflproc=evalfis(experto2.proc,influencia);
experto3.inflproc=evalfis(experto3.proc,influencia);
experto4.inflproc=evalfis(experto4.proc,influencia);
experto5.inflproc=evalfis(experto5.proc,influencia);

experto1.infldesa=evalfis(experto1.desa,influencia);
experto2.infldesa=evalfis(experto2.desa,influencia);
experto3.infldesa=evalfis(experto3.desa,influencia);
experto4.infldesa=evalfis(experto4.desa,influencia);
experto5.infldesa=evalfis(experto5.desa,influencia);

experto1.inflfina=evalfis(experto1.fina,influencia);
experto2.inflfina=evalfis(experto2.fina,influencia);
experto3.inflfina=evalfis(experto3.fina,influencia);
experto4.inflfina=evalfis(experto4.fina,influencia);
experto5.inflfina=evalfis(experto5.fina,influencia);

%se obtiene la perspectiva promedio resultante
influencia.cliente=mean([experto1.inflcliente experto2.inflcliente experto3.inflcliente experto4.inflcliente experto5.inflcliente]);
influencia.proc=mean([experto1.inflproc experto2.inflproc experto3.inflproc experto4.inflproc experto5.inflproc]);
influencia.desa=mean([experto1.infldesa experto2.infldesa experto3.infldesa experto4.infldesa experto5.infldesa]);
influencia.fina=mean([experto1.inflfina experto2.inflfina experto3.inflfina experto4.inflfina experto5.inflfina]);

figure
bar([influencia.cliente influencia.proc influencia.desa influencia.fina],'r')
set(gca,'XTickLabel',{'Cliente','Procesos','Desarrollo','Financiera'})
title('influencia relativa de las perspectivas')

%% evaluación de las perspectivas de las empresas en estudio
% a cada empresa se le hace una evaluación de sus indicadores
MD=0;D=25;R=50;M=75;S=100;
empresa1.cliente=[R D D R];
empresa1.proc=[R MD M R];
empresa1.desa=[MD D MD R];
empresa1.fina=[R R M R];

empresa2.cliente=[M D R M];
empresa2.proc=[M D M M];
empresa2.desa=[MD M D R];
empresa2.fina=[M M MD D];

empresa3.cliente=[R D R D];
empresa3.proc=[MD MD M D];
empresa3.desa=[MD R D D];
empresa3.fina=[R D D R];

% se calcula el logro de cada perspectiva de cada empresa

empresa1.logrocliente=evalfis(empresa1.cliente,logro);
empresa2.logrocliente=evalfis(empresa2.cliente,logro);
empresa3.logrocliente=evalfis(empresa3.cliente,logro);

empresa1.logroproc=evalfis(empresa1.proc,logro);
empresa2.logroproc=evalfis(empresa2.proc,logro);
empresa3.logroproc=evalfis(empresa3.proc,logro);

empresa1.logrodesa=evalfis(empresa1.desa,logro);
empresa2.logrodesa=evalfis(empresa2.desa,logro);
empresa3.logrodesa=evalfis(empresa3.desa,logro);

empresa1.logrofina=evalfis(empresa1.fina,logro);
empresa2.logrofina=evalfis(empresa2.fina,logro);
empresa3.logrofina=evalfis(empresa3.fina,logro);

figure
bar([empresa1.logrocliente empresa1.logroproc empresa1.logrodesa empresa1.logrofina],'b')
set(gca,'XTickLabel',{'Cliente','Procesos','Desarrollo','Financiera'})
title('logros difusos de las perspectivas de la empresa 1')

figure
bar([empresa2.logrocliente empresa2.logroproc empresa2.logrodesa empresa2.logrofina],'m')
set(gca,'XTickLabel',{'Cliente','Procesos','Desarrollo','Financiera'})
title('logros difusos de las perspectivas de la empresa 2')

figure
bar([empresa3.logrocliente empresa3.logroproc empresa3.logrodesa empresa3.logrofina],'g')
set(gca,'XTickLabel',{'Cliente','Procesos','Desarrollo','Financiera'})
title('logros difusos de las perspectivas de la empresa 3')

%% se evalua el balance de la información de cada empresa

empresa1.evaluador=[empresa1.logrocliente influencia.cliente empresa1.logroproc influencia.proc...
    empresa1.logrodesa influencia.desa empresa1.logrofina influencia.fina];
empresa2.evaluador=[empresa2.logrocliente influencia.cliente empresa2.logroproc influencia.proc...
    empresa2.logrodesa influencia.desa empresa2.logrofina influencia.fina];
empresa3.evaluador=[empresa3.logrocliente influencia.cliente empresa3.logroproc influencia.proc...
    empresa3.logrodesa influencia.desa empresa3.logrofina influencia.fina];


empresa1.balance=evalfis(empresa1.evaluador,bscd);
empresa2.balance=evalfis(empresa2.evaluador,bscd);
empresa3.balance=evalfis(empresa3.evaluador,bscd);
figure
bar([empresa1.balance empresa2.balance empresa3.balance])
set(gca,'XTickLabel',{'empresa 1', 'empresa 2', 'empresa 3'})
title('selección de la empresa usando BSCD')
