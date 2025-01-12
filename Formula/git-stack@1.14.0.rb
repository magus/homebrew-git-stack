class GitStackAT1140 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.14.0"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.14.0/git-stack-cli-macos"
    sha256 "34b3470ae0cacd9510b06d99fc450d59ce1197276437e54665b8a519039fd976"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.14.0/git-stack-cli-linux"
    sha256 "a4aa4b03fdc428aa9d3053cc6d9dd97dd6c6f1dd0ff5504692d3f1102a37be0b"
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
