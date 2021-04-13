CREATE TABLE Atlar
(
[At Id] INTEGER CONSTRAINT [At Id] PRIMARY KEY,
Ad CHAR(20),
Irk CHAR(20),
Cinsiyet CHAR(10)
);

CREATE TABLE E�itmenler
(
[E�itmen Id] INTEGER CONSTRAINT [E�itmen Id] PRIMARY KEY,
Ad CHAR(20) NOT NULL,
Soyad CHAR(20) NOT NULL,
Telefon char(11) NOT NULL,
[At Id] INTEGER NOT NULL,
CONSTRAINT AtYA FOREIGN KEY ([At Id]) REFERENCES Atlar ([At Id]),
);

CREATE TABLE �cretlendirme
(
G�n INTEGER CONSTRAINT G�n PRIMARY KEY,
�cret MONEY
);

CREATE TABLE �yelik
(
[Paket Id] INTEGER CONSTRAINT [Paket Id] PRIMARY KEY,

[E�itmen Id] INTEGER NOT NULL,
CONSTRAINT E�itIdYA FOREIGN KEY ([E�itmen Id]) REFERENCES E�itmenler ([E�itmen Id]),

G�n INTEGER NOT NULL,
CONSTRAINT G�nYA FOREIGN KEY (G�n) REFERENCES �cretlendirme (G�n),

[Ders Saati] INTEGER NOT NULL,
Manej CHAR(1),
Sat�ld� CHAR(5)
);

CREATE TABLE M��teriler
(
[M��teri Id] INTEGER CONSTRAINT [M��teri Id] PRIMARY KEY ,
Ad CHAR(20) NOT NULL,
Soyad CHAR(20) NOT NULL,
Telefon char(11) NOT NULL,
[Do�um Tarihi] Date,
[Paket Id] INTEGER NOT NULL,
CONSTRAINT PaketYA FOREIGN KEY ([Paket Id]) REFERENCES �yelik ([Paket Id]),
);