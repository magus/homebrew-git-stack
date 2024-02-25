class GitStackAt107 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.0.7"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.0.7/git-stack-cli-macos"
    sha256 "a652be3663d71f90727739e5cfd5f37492de0d2dd629223fb121dd4452b722b7"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.0.7/git-stack-cli-linux"
    sha256 "187c7d59e98506d56232afde072955ae8d83c13df105b91dda2e60532e17acf6"
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
