# devsh

Agent skill for managing cloud development VMs with [devsh](https://github.com/karlorz/cmux). Gives your AI coding agent the ability to create, manage, and access remote development environments with built-in browser automation.

## Install

```bash
npx skills add karlorz/devsh
```

Or install for a specific agent:

```bash
npx skills add karlorz/devsh -a claude-code
npx skills add karlorz/devsh -a cursor
```

### Manual Installation

If you cloned this repo, you can install/uninstall the skill directly:

| Command | Description |
|---------|-------------|
| `make install` | Install devsh skill to `~/.claude/skills/devsh/` |
| `make uninstall` | Remove devsh skill from `~/.claude/skills/devsh/` |

## Prerequisites

Install the devsh CLI:

```bash
npm install -g devsh
```

Then authenticate:

```bash
devsh auth login
```

## What your agent can do

Once installed, your AI coding agent can:

### Create and manage VMs

```bash
devsh start ./my-project         # Create VM, sync directory
devsh start -p pve-lxc .         # Create VM with PVE LXC provider
devsh ls                         # List all VMs
devsh status <id>                # Show VM status and URLs
devsh pause <id>                 # Pause VM
devsh resume <id>                # Resume VM
devsh delete <id>                # Delete VM
```

### Access VMs

```bash
devsh code <id>                  # Open VS Code in browser
devsh vnc <id>                   # Open VNC desktop
devsh ssh <id>                   # SSH into VM
devsh exec <id> "npm run dev"    # Run commands
```

### Transfer files

```bash
devsh sync <id> <path>           # Sync files to VM
devsh sync <id> <path> --pull    # Pull files from VM
```

### Manage tasks

```bash
devsh task list                          # List active tasks
devsh task create --repo owner/repo "prompt"  # Create task
devsh task show <task-id>                # Get task details
devsh task stop <task-id>                # Stop/archive task
```

### Browser automation

```bash
devsh computer snapshot <id>     # Get accessibility tree
devsh computer open <id> <url>   # Navigate browser
devsh computer click <id> @e1    # Click element
devsh computer screenshot <id>   # Take screenshot
```

## Provider Selection

```bash
# Explicit provider
devsh start -p morph .           # Use Morph Cloud
devsh start -p pve-lxc .         # Use PVE LXC (self-hosted)

# Auto-detect from environment
export PVE_API_URL=https://pve.example.com
export PVE_API_TOKEN=root@pam!token=secret
devsh start .                    # Auto-selects pve-lxc
```

## CLI Source Code

The devsh CLI source code lives in [`packages/devsh`](https://github.com/karlorz/cmux/tree/main/packages/devsh) in the [karlorz/cmux](https://github.com/karlorz/cmux) repo.

## License

MIT
