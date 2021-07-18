/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     30/06/2021 11.57.27                          */
/*==============================================================*/


drop table if exists BARANG;

drop table if exists PEMBELI;

drop table if exists TRANSAKSI;

/*==============================================================*/
/* Table: BARANG                                                */
/*==============================================================*/
create table BARANG
(
   ID_BARNG             numeric(8,0) not null,
   ID_BARANG            numeric(8,0),
   NAMA_BARANG          text,
   HARGA                numeric(8,0),
   STOK                 numeric(8,0),
   primary key (ID_BARNG)
);

/*==============================================================*/
/* Table: PEMBELI                                               */
/*==============================================================*/
create table PEMBELI
(
   ID_BARANG            numeric(8,0),
   ID_PEMBELI           numeric(8,0),
   NAMA_PEMBELI         text,
   NOMER_TELP           numeric(8,0),
   TANGGAL              date,
   ALAMAT               text
);

/*==============================================================*/
/* Table: TRANSAKSI                                             */
/*==============================================================*/
create table TRANSAKSI
(
   ID_BARANG            numeric(8,0) not null,
   NAMA_BARANG          text,
   ID_PEMBELI           numeric(8,0),
   KETERANGAN           text,
   primary key (ID_BARANG)
);

alter table BARANG add constraint FK_MELAKUKAN foreign key (ID_BARANG)
      references TRANSAKSI (ID_BARANG) on delete restrict on update restrict;

alter table PEMBELI add constraint FK_TERJADI foreign key (ID_BARANG)
      references TRANSAKSI (ID_BARANG) on delete restrict on update restrict;

