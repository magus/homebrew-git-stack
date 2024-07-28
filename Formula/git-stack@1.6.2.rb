class GitStackAT162 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.6.2"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.6.2/git-stack-cli-macos"
    sha256 "5373ea6e90cf5b6d4c1f37bb6bf1b5060ce78d6ed4fdd6946613a425216cf58b"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.6.2/git-stack-cli-linux"
    sha256 "0582039030e1872a264370d3770d13c3a223523dfcde30620d29d81735b3e4ca"
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
