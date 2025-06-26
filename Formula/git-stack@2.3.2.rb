class GitStackAT232 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "2.3.2"

  if OS.mac?
    if Hardware::CPU.arm? || Hardware::CPU.in_rosetta2?
      url "https://github.com/magus/git-stack-cli/releases/download/2.3.2/git-stack-bun-darwin-arm64.zip"
      sha256 "d0648343d708904c4454057511f893cca03cf870c82c4cf6f51de1e37c2ec7da"

      def filename
        "git-stack-bun-darwin-arm64.zip"
      end
    else
      url "https://github.com/magus/git-stack-cli/releases/download/2.3.2/git-stack-bun-darwin-x64.zip"
      sha256 "006d639fc74cc54e30c9e4f7a929b8d201276f397b86594e5167726b6bc1ea7d"

      def filename
        "git-stack-bun-darwin-x64.zip"
      end
    end
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/2.3.2/git-stack-bun-linux-x64.zip"
    sha256 "f15a33a0045a49f0194b8b6b5f27122e8ab21b1d5ec7249372a43a2627810b71"

    def filename
      "git-stack-bun-linux-x64.zip"
    end
  else
    odie "Unsupported platform. Please submit a bug report here: https://github.com/magus/git-stack-cli/issues\n#{OS.report}"
  end

  # official Github CLI
  # https://cli.github.com/
  depends_on "gh"

  # git revise for faster, in-memory rebasing
  # https://github.com/mystor/git-revise
  depends_on "git-revise"

  def install
    binary_name = filename.sub(/\.zip$/, "")
    bin.install binary_name => "git-stack"
  end

  test do
    assert_match version, shell_output("#{bin}/git-stack --version")
    assert_match "Must be run from within a git repository.", shell_output("#{bin}/git-stack 2>&1", 9)
  end
end
