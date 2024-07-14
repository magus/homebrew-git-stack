class GitStackAT161 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.6.1"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.6.1/git-stack-cli-macos"
    sha256 "f0ed5bd6d2744f7e5f676a31d3e91f57420e5d6027eb167e71e27b3d82aee8fb"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.6.1/git-stack-cli-linux"
    sha256 "fee9088935ef2bae22dcf6b87ed5532f402d7d1e584ff3566074f63b55e3300f"
  end

  # official Github CLI
  # https://cli.github.com/
  depends_on "gh"

  # git revise for faster, in-memory rebasing
  # https://github.com/mystor/git-revise
  depends_on "git-revise"

  def install
    bin.install "git-stack-cli-macos" => "git-stack" if OS.mac?
    bin.install "git-stack-cli-linux" => "git-stack" if OS.linux?
  end

  test do
    assert_match version, shell_output("#{bin}/git-stack --version")
    assert_match "Must be run from within a git repository.", shell_output("#{bin}/git-stack 2>&1", 9)
  end
end
