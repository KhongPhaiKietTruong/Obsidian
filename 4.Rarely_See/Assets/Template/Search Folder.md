<%*
// Get all folder paths
let folders = app.vault.getAllFolders();
// Filter out the root directory
folders = folders.filter(folder => folder.path !== "/");

const autoCollapse = true;

// Prepare folder names and corresponding paths for display
const folderPaths = folders.map(f => f.path);
const folderNames = folders.map(f => {
    // Get folder depth for indentation display
    const depth = f.path.split('/').length - 1;
    const indent = '  '.repeat(depth);
    // Use 📁 emoji to represent folders
    return `${indent}📁 ${f.name} (${f.path})`;
});

// Use Templater's suggester to create a selector
// The first parameter of tp.system.suggester is the array or function of displayed text, the second is the array of actual values
let selectedFolderPath = await tp.system.suggester(folderNames, folderPaths);

// Exit if the user cancels the selection
if (selectedFolderPath === null) return;

// Get the selected folder object
const selectedFolder = app.vault.getAbstractFileByPath(selectedFolderPath);

// If the folder is found, focus on it in the File Explorer
if (selectedFolder) {
    if (autoCollapse) {
        app.workspace.getLeavesOfType('file-explorer')[0].view.tree.setCollapseAll(true)
    }
    
    try {
        // Try to focus on the folder using internal API
        const fileExplorerLeaves = app.workspace.getLeavesOfType('file-explorer');
        // Check if there are available leaf nodes
        if (fileExplorerLeaves.length === 0) {
            // If not, create a new file explorer tab (refer to source code logic)
            const leaf = app.workspace.getLeaf('tab');
            await leaf.setViewState({ type: 'file-explorer' });
            fileExplorerLeaves.push(leaf);
        }
        // Get the first file explorer view instance
        const fileExplorerView = fileExplorerLeaves[0].view;

        // Force activate the file explorer tab (ensure the view is visible)
        app.workspace.revealLeaf(fileExplorerLeaves[0]);

        const targetFile = app.vault.getAbstractFileByPath(selectedFolderPath);
        fileExplorerView.revealInFolder(targetFile);
    } catch (error) {
        // If all methods fail, show a notice
        new Notice( `Unable to focus on folder in file explorer: ${selectedFolderPath}, please search manually` );
    }

    // Show a notice indicating the operation was successful
    new Notice(`Selected folder: ${selectedFolderPath}`);
} else {
    new Notice(`Folder not found: ${selectedFolderPath}`);
}
%>