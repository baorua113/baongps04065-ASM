-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-04-01 16:35:55.053

-- tables
CREATE DATABASE ASMBaoPs04065
go
-- Table: CTHoaDon
CREATE TABLE CTHoaDon (
    mahd varchar(15)  NOT NULL,
    masp varchar(15)  NOT NULL,
    soluong int  NOT NULL,
    dongia float  NOT NULL,
    CONSTRAINT CTHoaDon_pk PRIMARY KEY  (mahd,masp)
);

-- Table: HoaDon
CREATE TABLE HoaDon (
    mahd varchar(15)  NOT NULL,
    makh varchar(15)  NOT NULL,
    ngaylap date  NOT NULL,
    tongtien float  NOT NULL,
    CONSTRAINT HoaDon_pk PRIMARY KEY  (mahd)
);

-- Table: KhachHang
CREATE TABLE KhachHang (
    makh varchar(15)  NOT NULL,
    tenkh nvarchar(100)  NOT NULL,
    gioitinh nvarchar(5)  NOT NULL,
    diachi nvarchar(100)  NOT NULL,
    sdt char(11)  NOT NULL,
    CONSTRAINT KhachHang_pk PRIMARY KEY  (makh)
);

-- Table: LoaiSanPham
CREATE TABLE LoaiSanPham (
    malsp varchar(15)  NOT NULL,
    tenlsp nvarchar(100)  NOT NULL,
    CONSTRAINT LoaiSanPham_pk PRIMARY KEY  (malsp)
);

-- Table: SanPham
CREATE TABLE SanPham (
    masp varchar(15)  NOT NULL,
    tensp nvarchar(100)  NOT NULL,
    malsp varchar(15)  NOT NULL,
    soluong int  NOT NULL,
    dongianhap float  NOT NULL,
    dongiaban float  NOT NULL,
    hinhanh varchar(100)  NOT NULL,
    CONSTRAINT SanPham_pk PRIMARY KEY  (masp)
);

-- foreign keys
-- Reference: CTHoaDon_HoaDon (table: CTHoaDon)
ALTER TABLE CTHoaDon ADD CONSTRAINT CTHoaDon_HoaDon
    FOREIGN KEY (mahd)
    REFERENCES HoaDon (mahd);

-- Reference: CTHoaDon_SanPham (table: CTHoaDon)
ALTER TABLE CTHoaDon ADD CONSTRAINT CTHoaDon_SanPham
    FOREIGN KEY (masp)
    REFERENCES SanPham (masp);

-- Reference: HoaDon_KhachHang (table: HoaDon)
ALTER TABLE HoaDon ADD CONSTRAINT HoaDon_KhachHang
    FOREIGN KEY (makh)
    REFERENCES KhachHang (makh);

-- Reference: SanPham_LoaiSanPham (table: SanPham)
ALTER TABLE SanPham ADD CONSTRAINT SanPham_LoaiSanPham
    FOREIGN KEY (malsp)
    REFERENCES LoaiSanPham (malsp);

-- End of file.

