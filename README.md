# FiveM-Soundpack-Swapper

## How to Use

1. **Prepare Soundpack Folders**:
   - Create one or more folders in the same directory as the batch file.
   - Name them descriptively (e.g., `Sinners`, `Bell`, `Default`).
   - Copy your `RESIDENT.rpf` and `WEAPONS_PLAYER.rpf` files into each folder accordingly.

2. **Run the Batch File**:
   - Double-click the batch file to execute it.
   - A list of available soundpack directories will be displayed.

3. **Select a Soundpack**:
   - When prompted, enter the number corresponding to the soundpack you wish to install.
   - Press **Enter** to confirm your selection.

4. **Installation**:
   - The script will verify the presence of the required `.rpf` files.
   - If both files are found, it will copy them to the target directory in your GTA V installation.

5. **Completion**:
   - Upon successful copying, a confirmation message will appear.
   - Press any key to exit the script.

## Important Notes

- **Target Path**: The default target path is set to:

  ```
  C:\Program Files (x86)\Steam\steamapps\common\Grand Theft Auto V\x64\audio\sfx
  ```

  If your GTA V installation is located elsewhere, edit the `TARGET_PATH` variable in the batch file to match your game's directory.

---
