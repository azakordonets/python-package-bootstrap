# Make the venv if non existent.
if [[ ! -d venv ]]; then
  printf "Creating venv ..."
  python3 -m venv venv
  printf "\b\b\bdone!\n"
fi

# Activate the venv (done once or each time you open a new Terminal window).
source venv/bin/activate

# Update pip to last version
pip install --upgrade pip

# Install required packages (only done once).
pip install --editable .

pip install '.[dev]' .
pip install '.[test]' .
pre-commit install