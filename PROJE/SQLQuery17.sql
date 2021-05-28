CREATE TABLE Atlar
(
[At Id] INTEGER CONSTRAINT [At Id] PRIMARY KEY,
Ad CHAR(20),
Irk CHAR(20),
Cinsiyet CHAR(10)
);

CREATE TABLE Eğitmenler
(
[Eğitmen Id] INTEGER CONSTRAINT [Eğitmen Id] PRIMARY KEY,
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

[Eğitmen Id] INTEGER NOT NULL,
CONSTRAINT EğitIdYA FOREIGN KEY ([Eğitmen Id]) REFERENCES Eğitmenler ([Eğitmen Id]),

Gün INTEGER NOT NULL,
CONSTRAINT GünYA FOREIGN KEY (Gün) REFERENCES Ücretlendirme (Gün),

[Ders Saati] INTEGER NOT NULL,
Manej CHAR(1),
Satıldı CHAR(5)
);

CREATE TABLE Müşteriler
(
[Müşteri Id] INTEGER CONSTRAINT [Müşteri Id] PRIMARY KEY ,
Ad CHAR(20) NOT NULL,
Soyad CHAR(20) NOT NULL,
Telefon char(11) NOT NULL,
[Doğum Tarihi] Date,
[Paket Id] INTEGER NOT NULL,
CONSTRAINT PaketYA FOREIGN KEY ([Paket Id]) REFERENCES Üyelik ([Paket Id]),
);
