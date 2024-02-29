# Snowkit: A Snowflake Toolkit

Snowkit is a expanding suite of tools for working with Snowflake. It includes a set of tools for transforming raw data into semantically enriched documents, and a set of tools for managing streams and tasks for syncing semantically enriched documents into vector indexes.

We are currently experimenting with [Snow CLI v2](https://docs.snowflake.com/LIMITEDACCESS/snowcli-v2/snowcli-guide), which is not yet publicly available.

### Getting Started

To get started, you will need to setup your [snowpark environment](https://docs.snowflake.com/en/developer-guide/snowpark/python/setup) and [install the snow-cli](https://docs.snowflake.com/LIMITEDACCESS/snowcli-v2/installation/installation).

After your snowpark environment is ready, install the snow-cli:

```bash
pip install snowflake-cli-labs
```

### Virtual Environment

It is recommended to use a virtual environment to manage your dependencies. You can create a virtual environment using the following command:

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

or on windows:

```bash
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt
```

### Setting Up

Once you have the CLI installed and virtual environment activated, you can run the setup script to get started. This will create a new database, schemas, stages, and anything else needed for Snowkit.

```bash
snow sql -f scripts/setup.sql
```

To create a demo for the record manager and document transformer, you can run the demo script:

```bash
snow sql -f scripts/demo.sql
```

### Teardown

During development, you can run the teardown script to teardown the database to start fresh:

```bash
snow sql -f scripts/teardown.sql
```

This will drop the database and schema, so be careful when running this command. **There is no way to recover the data once it has been dropped.**

### Build Package

To build the package, you can run the following command:

```bash
snow snowpark build --pypi-download=yes --no-check-anaconda-for-pypi-deps --package-native-libraries=yes
```

This will build the package, fetch any dependencies from PyPI, and package the native libraries. Everything will be bundles in a .zip file that you can deploy to Snowflake.

### Deploy Package

To deploy the package, you can run the following command:

```bash
snow snowpark deploy -c snowkit-dev --replace
```

This will deploy the package to Snowflake, so you can start using it in your Snowflake environment.

This example assumes that you have a Snowflake connection named `snowkit-dev` in your Snowflake environment. You can replace this with the name of your connection, or you can create a new connection using the snow-cli.

### Features

Snowkit is a suite of tools for working with Snowflake. It includes the following features:

- **Snowmantics**: A tool for transforming snowflake tables into semantically enriched LangChain documents. This is useful for automating the process of transforming raw data into a format that is more suitable for semantic search against vector indexes.
- **SnowPine**: A tool for managing snowflake streams and task for syncing semantically enriched documents (from Snowmantics) into Pinecone. This is useful for automating the process of syncing data from Snowflake into Pinecone for vector indexing, like a typical ETL process.

### Contributing

If you would like to contribute to Snowkit, please open a pull request. We are always looking for new contributors to help us improve the toolkit.

### License

Snowkit is full open source and is licensed under the MIT License. You can find the full license in the [LICENSE](LICENSE) file.
