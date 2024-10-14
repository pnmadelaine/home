{
  config,
  lib,
  pkgs,
  ...
}:

{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "vscode-extension-ms-vscode-remote-remote-ssh"
    ];
  programs.ssh.matchBlocks = {
    scylla.hostname = "195.25.209.241";
  };
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = [
      pkgs.vscode-extensions.ms-vscode-remote.remote-ssh
    ];
    userSettings = {
      # even better toml
      evenBetterToml = {
        formatter = {
          alignComments = false; # Don't really know what this does
          alignEntries = false; # Adds too much spaces without breaking the lines
          allowedBlankLines = 2; # As we have no real use case for more than 2 blank lines
          arrayAutoCollapse = false; # Prefer multiple lines array
          arrayAutoExpand = true; # Prefer multiple lines array
          arrayTrailingComma = true; # For consistency
          columnWidth = 120; # For consistency with rust
          indentEntries = true; # For better readability, specifically for `[dependencies.${dep_name}]` entries
          indentString = "\t"; # We use tabs
          indentTables = true; # For better readability
          inlineTableExpand = true; # Prefer multiple lines array
          reorderKeys = true; # To keep our custom order
          trailingNewline = true; # For all files
        };
        semanticTokens = true; # For better highlighting
      };
      # other necessary configuration
      editor.formatOnSave = true;
      git.openRepositoryInParentFolders = "always";
      protoc = {
        options = [
          "--proto_path=src/protos/"
          "--proto_path=src/grpc/*"
        ];
      };
      rust-analyzer = {
        completion.autoimport.enable = false;
        lens.implementations.enable = false; # Avoids code move a few seconds after opening. Feature still available through right click -> Go to implementations
        procMacro.enable = true;
        rustfmt.extraArgs = [
          "--config"
          "comment_width=120,condense_wildcard_suffixes=false,format_code_in_doc_comments=true,format_macro_bodies=true,hex_literal_case=Upper,imports_granularity=One,normalize_doc_attributes=true,wrap_comments=true"
        ];
        diagnostics.disabled = [
          "unresolved-method" # workaround https://github.com/rust-lang/rust-analyzer/issues/14259
          "unresolved-field" # workaround https://github.com/rust-lang/rust-analyzer/issues/14259
        ];
      };
      editor.renderWhitespace = "boundary";
      editor.guides.bracketPairs = "active";
      files.insertFinalNewline = true;
      files.trimFinalNewlines = true;
      pgFormatter.tabs = true;
      pgFormatter.wrapLimit = 120;
      "[python]".editor.defaultFormatter = "ms-python.black-formatter";
      python.analysis.typeCheckingMode = "basic";
    };
  };

}
