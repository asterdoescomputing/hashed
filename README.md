# Hashed

Hashed is a lightweight Windows batch utility that backs up critical registry hives (`HKLM\SAM` and `HKLM\SYSTEM`) into local `.save` files for offline analysis, recovery workflows, and security lab use.

The script is designed for clarity: it checks for Administrator privileges, saves each hive to the script directory, and prints step-by-step success or failure output.

## Features

- Backs up `HKLM\SAM` and `HKLM\SYSTEM`
- Clear console status logs for each operation
- Saves output directly beside the script
- Works as a standalone `.bat` file (no installation required)

## Requirements

- Windows operating system
- Administrator privileges
- `reg` command available (included in standard Windows environments)

## Usage

1. Open Command Prompt as **Administrator**.
2. Run `hashed.bat`.
3. Wait for completion and check the generated files.

## Output

When successful, the script creates:

- `sam.save`
- `system.save`

Both files are written to the same directory as `hashed.bat`.

## How It Works

1. Verifies Administrator privileges using `net session`.
2. Resolves the script directory path.
3. Runs:
   - `reg save HKLM\SAM "<scriptDir>sam.save"`
   - `reg save HKLM\SYSTEM "<scriptDir>system.save"`
4. Prints completion status and lists `.save` files in the directory.

## Important Notice

Registry hives can contain sensitive credential and system data.

- Use this tool only on systems you own or are explicitly authorized to assess.
- Store exported hive files securely.
- Follow local laws, policies, and organizational security rules.

## Contributing

Contributions are welcome.

To contribute:

1. Fork the repository.
2. Create a new branch.
3. Make your changes.
4. Open a pull request with a clear summary.

## License

This project is licensed under the MIT License.
See the `LICENSE` file for details.

## Contact

GitHub: https://github.com/asterdoescomputing
