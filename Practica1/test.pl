
% PRIMERA PARTE

% esTorre()
esTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(s(s(0))),s(0),a)]).
    yes
esTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(s(0)),s(0),r),pieza(s(0),s(s(s(0))),s(0),r)]).
    yes
esTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(s(0)),s(0),r),pieza(s(s(0)),s(s(0)),s(s(0)),v),pieza(s(s(s(0))),s(s(s(0))),s(s(s(0))),am)]).
    yes
esTorre([pieza(s(s(0)),s(0),s(0),r),pieza(s(0),s(0),s(0),a)]).
    no
esTorre([pieza(s(0),s(0),s(s(0)),r),pieza(s(0),s(0),s(0),a)]).
    no
esTorre([pieza(s(s(0)),s(s(0)),s(s(0)),r),pieza(s(0),s(0),s(0),a)]).
    no
esTorre([s(s(s(s(0)))),pieza(s(0),s(0),r),pieza(s(0),s(0),s(0),a)]).
    no
esTorre([pieza(0,0,0,r),pieza(s(0),s(s(s(0))),s(0),a)]).
    no

% alturaTorre()
alturaTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],s(s(0))).
    yes
alturaTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(s(0)),s(0),r),pieza(s(0),s(s(s(0))),s(0),r)],s(s(s(s(s(s(0))))))).
    yes
alturaTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],s(0)).
    no
alturaTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(s(0)),s(0),r),pieza(s(0),s(s(s(0))),s(0),r)],s(s(0))).
    no
alturaTorre([pieza(s(0),s(0),s(0),r),cosa(s(0),s(0),s(0),a)],s(s(s(0)))).
    no
alturaTorre([pieza(s(s(0)),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],s(s(s(0)))).
    no

% coloresTorre()
coloresTorre([pieza(s(0),s(0),s(0),a)],[a]).
    yes
coloresTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],[r,a]).
    yes
coloresTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],[r,r,a]).
    yes
coloresTorre([pieza(s(0),s(0),s(0),am),pieza(s(0),s(0),s(0),am),pieza(s(0),s(0),s(0),am),pieza(s(0),s(0),s(0),a)],[am,am,am,a]).
    yes
coloresTorre([pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],[v,r,r,r,a]).
    yes
coloresTorre([pieza(s(0),s(0),s(0),a)],[]).
    no
coloresTorre([pieza(s(0),s(0),s(0),color)],[v]).
    no
coloresTorre([pieza(s(0),s(0),s(0),a)],[color]).
    no
coloresTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],[r,r]).
    no
coloresTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],[r,r,v]).
    no
coloresTorre([pieza(s(0),s(0),s(0),am),pieza(s(0),s(0),s(0),am),pieza(s(0),s(0),s(0),am),pieza(s(0),s(0),s(0),a)],[a,am,am,a]). 
    no
coloresTorre([pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],[v,r,r,a]).
    no
coloresTorre([pieza(s(0), s(0), s(0), r), pieza(s(0), s(0), s(1), a)], [r, a]).
    no
coloresTorre([pieza(s(0), 0, s(0), r), pieza(s(0), s(0), s(0), a)], [r, a]).
    no

% ColoresIncluidos()
coloresIncluidos([pieza(s(0),s(0),s(0),r)],[pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),a)]).
    yes
coloresIncluidos([pieza(s(0),s(0),s(0),r),pieza(s(s(0)),s(0),s(0),a)],[pieza(s(0),s(0),s(0),a),pieza(s(0),s(0),s(0),r)]).
    yes
coloresIncluidos([pieza(s(0),s(0),s(0),a),pieza(s(0),s(0),s(0),a)],[pieza(s(s(0)),s(0),s(s(0)),a)]).
    yes
coloresIncluidos([pieza(s(0),s(0),s(0),a),pieza(s(0),s(0),s(0),a),pieza(s(0),s(0),s(0),am)],[pieza(s(0),s(0),s(0),a),pieza(s(0),s(0),s(0),am)]).
    yes
coloresIncluidos([pieza(s(0),s(0),s(0),a),pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),am)],[pieza(s(0),s(0),s(0),am),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),a)]).
    yes
coloresIncluidos([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r)],[pieza(s(s(0)),s(0),s(0),r),pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),a)]).
    no
coloresIncluidos([pieza(s(s(0)),s(0),s(0),r),pieza(s(0),s(0),s(0),r)],[pieza(s(s(0)),s(0),s(0),r),pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),a)]).
    no
coloresIncluidos([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r)],[pieza(s(0),s(0),s(0),v)]).
    no
coloresIncluidos([pieza(s(0),s(0),s(0),a),pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),am)],[pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),a)]).
    no
coloresIncluidos([pieza(s(0),s(0),s(0),a),pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),am)],[pieza(s(0),s(0),s(0),r)]).
    no

% SEGUNDA PARTE

% esEdificioPar()
esEdificioPar([[b,b,r,r,b,b],[b,v,v,v,v,b],[b,b,v,v,b,b],[a,a,am,a,a,a],[b,b,am,am,b,b]]).
    yes
esEdificioPar([[b,r,r,r,r,b],[b,v,v,v,v,b],[b,b,v,v,b,b],[a,a,am,a,a,a],[b,b,am,am,b,b]]).
    yes
esEdificioPar([[b,b,b,r,b,b],[b,v,v,v,b,b],[b,v,v,v,b,b],[a,a,a,am,a,a,a],[b,b,am,am,b,b]]).
    no
esEdificioPar([[b,r,r,r,r,b],[b,v,v,v,v,b],[b,b,v,v,b,b],[a,a,a,am,a,a,a],[b,b,am,b,b,b]]).
    no
esEdificioPar([[b,t,r,r,r,b],[b,v,x,m,v,b],[b,b,v,v,b,b],[a,a,a,am,a,a,a],[b,b,am,b,b,b]]).
    no

% esEdificioPiramide()
esEdificioPiramide([[b,b,r,b,b],[b,r,a,am,b],[r,v,a,r,r]]).
    yes
esEdificioPiramide([[b,b,b,v,b,b,b],[b,b,r,v,r,b,b],[b,r,a,am,v,a,b],[r,r,r,r,r,r,r]]).
    yes
esEdificioPiramide([[b,b,b,b,v,b,b,b,b],[b,b,b,r,v,r,b,b,b],[b,b,r,a,am,v,a,b,b],[b,r,r,r,r,r,r,r,b],[am,r,r,r,r,r,r,r,am]]).
    yes
esEdificioPiramide([[v,b,b,b,b,b,b,b,b],[r,v,b,b,b,b,b,b,b],[am,a,r,a,am,b,b,b,b],[a,r,r,r,r,r,r,r,b],[am,r,r,r,r,r,r,r,am]]).
    yes
esEdificioPiramide([[b,b,b,b,b,b,b,b,r],[b,b,b,b,b,a,a,a,a],[b,b,b,b,am,v,a,am,am],[b,b,r,r,r,r,r,r,a],[am,r,r,r,r,r,r,r,a]]).
    yes