class GitStackAt105 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.0.5"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.0.5/git-stack-cli-macos"
    sha256 "c360774eff9c620c19fca547c0ef266cb4e1629313e64813f12cbf08d93d51d1"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.0.5/git-stack-cli-linux"
    sha256 "8f67331ad6a4bcf446e98630ee9d0a17ae4ae33331c912bb48c8038f1ba61339"
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
