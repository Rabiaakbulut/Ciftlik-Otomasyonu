CREATE TABLE Atlar
(
[At Id] INTEGER CONSTRAINT [At Id] PRIMARY KEY,
Ad CHAR(20),
Irk CHAR(20),
Cinsiyet CHAR(10)
);

CREATE TABLE Eðitmenler
(
[Eðitmen Id] INTEGER CONSTRAINT [Eðitmen Id] PRIMARY KEY,
Ad CHAR(20) NOT NULL,
Soyad CHAR(20) NOT NULL,
Telefon char(11) NOT NULL,
[At Id] INTEGER NOT NULL,
CONSTRAINT AtYA FOREIGN KEY ([At Id]) REFERENCES Atlar ([At Id]),
);

CREATE TABLE Ücretlendirme
(
Gün INTEGER CONSTRAINT Gün PRIMARY KEY,
Ücret MONEY
);

CREATE TABLE Üyelik
(
[Paket Id] INTEGER CONSTRAINT [Paket Id] PRIMARY KEY,

[Eðitmen Id] INTEGER NOT NULL,
CONSTRAINT EðitIdYA FOREIGN KEY ([Eðitmen Id]) REFERENCES Eðitmenler ([Eðitmen Id]),

Gün INTEGER NOT NULL,
CONSTRAINT GünYA FOREIGN KEY (Gün) REFERENCES Ücretlendirme (Gün),

[Ders Saati] INTEGER NOT NULL,
Manej CHAR(1),
Satýldý CHAR(5)
);

CREATE TABLE Müþteriler
(
[Müþteri Id] INTEGER CONSTRAINT [Müþteri Id] PRIMARY KEY ,
Ad CHAR(20) NOT NULL,
Soyad CHAR(20) NOT NULL,
Telefon char(11) NOT NULL,
[Doðum Tarihi] Date,
[Paket Id] INTEGER NOT NULL,
CONSTRAINT PaketYA FOREIGN KEY ([Paket Id]) REFERENCES Üyelik ([Paket Id]),
);