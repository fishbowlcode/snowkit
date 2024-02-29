-- FOR TESTING PURPOSES ONLY
-- This script creates a table and a document transformer template for the record_manager as an example.

-- create a demo table called example_table
create or replace table snowkit.record_manager.example_table (
    item string,
    action string,
    status string,
    date date,
    uuid int,
    metadata string
);

-- insert the demo data into the example_table
insert into snowkit.record_manager.example_table (
    item, 
    action, 
    status, 
    date, 
    uuid, 
    metadata
)
values ('ball', 'digging in the dirt', 'successful', '2024-02-16', 1, 'meta1'),
       ('treats', 'sniffing around', 'unsuccessful', '2024-02-16', 2, 'meta2'),
       ('stick', 'chasing', 'successful', '2024-02-16', 3, 'meta3'),
       ('bone', 'fetching', 'unsuccessful', '2024-02-16', 4, 'meta4'),
       ('frisbee', 'jumping', 'successful', '2024-02-16', 5, 'meta5');


-- delete the document transformer template if it already exists
delete from snowkit.record_manager.document_transformer_template where name = 'example_template';

-- create a document transformer template for the example_table
insert into snowkit.record_manager.document_transformer_template (
    name, 
    template, 
    content_columns, 
    metadata_columns, 
    source_table
)
select 
    'example_template',
    'The dog looked for the {item} by {action} and was {status} on {date}.', 
    array_construct('item', 'action', 'status', 'date'), 
    array_construct('*'),
    'snowkit.record_manager.example_table';
