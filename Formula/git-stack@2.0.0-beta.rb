class GitStackAT200beta < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "2.0.0-beta"

  if OS.mac?
    if Hardware::CPU.arm? || Hardware::CPU.in_rosetta2?
      url "https://github.com/magus/git-stack-cli/releases/download/2.0.0-beta/git-stack-bun-darwin-arm64.zip"
      sha256 "ea239cf7dad13aabf5463650d079122718fa4a153c11904e0bac60335e7ece39"

      def filename
        "git-stack-bun-darwin-arm64.zip"
      end
    else
      url "https://github.com/magus/git-stack-cli/releases/download/2.0.0-beta/git-stack-bun-darwin-x64.zip"
      sha256 "d1758662536d0bb4d72f6ec5d4f29b2a4e90329a26ee94984ec9a901f610b2d1"

      def filename
        "git-stack-bun-darwin-x64.zip"
      end
    end
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/2.0.0-beta/git-stack-bun-linux-x64.zip"
    sha256 "e95fcac9c17c2750d830c6033fc9fa12953bfd7e7b4b25b9d8b71543a5f989b7"

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
