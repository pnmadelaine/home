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
      "slack"
      "vscode"
      "vscode-extension-ms-vscode-remote-remote-ssh"
    ];
  home.packages = [ pkgs.slack ];
  programs.ssh.matchBlocks = {
    scylla.hostname = "195.25.209.241";
  };
  programs.vscode = {
    enable = true;
    extensions = [
      pkgs.vscode-extensions.ms-vscode-remote.remote-ssh
    ];
    userSettings = {
      evenBetterToml = {
        formatter = {
          alignComments = false;
          alignEntries = false;
          allowedBlankLines = 2;
          arrayAutoCollapse = false;
          arrayAutoExpand = true;
          arrayTrailingComma = true;
          columnWidth = 120;
          indentEntries = true;
          indentString = "\t";
          indentTables = true;
          inlineTableExpand = true;
          reorderKeys = true;
          trailingNewline = true;
        };
        semanticTokens = true;
      };
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
        lens.implementations.enable = false;
        procMacro.enable = true;
        rustfmt.extraArgs = [
          "--config"
          "comment_width=120,condense_wildcard_suffixes=false,format_code_in_doc_comments=true,format_macro_bodies=true,hex_literal_case=Upper,imports_granularity=One,normalize_doc_attributes=true,wrap_comments=true"
        ];
        diagnostics.disabled = [
          "unresolved-method"
          "unresolved-field"
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
