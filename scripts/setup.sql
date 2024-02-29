-- DATABASES
create database if not exists snowkit;

-- SCHEMAS
create schema if not exists snowkit.app;
create schema if not exists snowkit.record_manager;

-- STAGES
create stage if not exists snowkit.app.core;

-- # Snowkit Record Manager

-- ## Document Transformer Template Table
-- This table is used to store the templates the document transformer will use to transform the sql table into a semantically enriched document.

-- ## Table Structure
-- id: primary key - the unique uuid of the template. defaults to a random uuid.
-- name: the name of the template
-- template: the template string that will be used to transform the sql table into a string phrase. use '{}' to indicate where the column values should be inserted.
-- content_columns: a list of the columns that will be used to generate the content of the document. a '*' will indicate that all columns should be used.
-- metadata_columns: a list of the columns that will be used to generate the metadata of the document. a '*' will indicate that all columns should be used.
-- source_table: the name of the fully qualified table that the template will be used to transform. this should be unique.

CREATE OR REPLACE TABLE snowkit.record_manager.document_transformer_template (
    id string default uuid_string(),
    name string,
    template string,
    content_columns array,
    metadata_columns array,
    source_table string not null unique
);
