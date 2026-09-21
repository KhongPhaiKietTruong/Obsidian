# Step-by-Step Guide to Publish Your Own Library onto PyPi using Poetry

Here are the detailed steps to package and publish your Python library onto PyPi:

### Step 1: Create a new project
First, you need to create a standard Poetry project structure by running:
* View command details: [[create project]]

### Step 2: Configure library metadata
Open the configuration file and update the descriptive information for your library, such as package name, version, author, and code directories:
* View configuration explanations: [[pyproject.toml]]

### Step 3: Configure PyPi authentication
Before uploading your library, you need to configure your PyPi credentials or security token in Poetry to get upload permission:
* Configure with username/password: [[add pypi account to poetry]]
* **Recommended:** Configure using an API Token for better security: [[add token to account]]

### Step 4: Publish to PyPi
Once the metadata is configured and authentication is set up, run the command to build and upload your package:
* View publishing command: [[publish to pypi]]
