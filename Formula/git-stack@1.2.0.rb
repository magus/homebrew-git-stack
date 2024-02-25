class GitStackAT120 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.2.0"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.2.0/git-stack-cli-macos"
    sha256 "bc1cf08dfa29b81311970fcdeb0b205871103dda636e9082795b3dfc69520e8b"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.2.0/git-stack-cli-linux"
    sha256 "1def41686fe68254a073c9df3aecde4e180fe5796d50016f1feab3aeb93c0730"
  end

  def install
    bin.install "git-stack-cli-macos" => "git-stack" if OS.mac?
    bin.install "git-stack-cli-linux" => "git-stack" if OS.linux?
  end

  test do
    assert_match version, shell_output("#{bin}/git-stack --version")
    assert_match "Must be run from within a git repository.", shell_output("#{bin}/git-stack 2>&1", 9)
  end
end
