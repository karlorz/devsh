# devsh

Agent skills for managing cloud development VMs and multi-agent orchestration with [devsh](https://github.com/karlorz/cmux).

## Skills

| Skill | Description |
|-------|-------------|
| `devsh` | Core CLI for cloud VMs - create, sync, ssh, exec, tasks, browser automation |
| `devsh-orchestrator` | Multi-agent orchestration - spawn and coordinate sub-agents in sandboxes |

## Install

```bash
# Install all skills
npx skills add karlorz/devsh --all

# Or install individually
npx skills add karlorz/devsh                      # Core VM management
npx skills add karlorz/devsh@devsh-orchestrator   # Multi-agent orchestration
```

Or install for a specific agent:

```bash
npx skills add karlorz/devsh --all -a claude-code
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

---

## devsh-orchestrator Skill

For multi-agent workflows, the orchestrator skill enables:

- **Parallel Development**: Spawn multiple agents on different parts of a codebase
- **Task Distribution**: Break down complex tasks and assign to specialized agents
- **Review Coordination**: Have one agent write code while another reviews
- **Dependency Management**: Chain agent tasks with `--depends-on`

```bash
# Spawn a sub-agent
devsh orchestrate spawn --agent claude/haiku-4.5 --repo owner/repo "Fix the auth bug"

# Check status
devsh orchestrate list

# Wait for completion
devsh orchestrate wait <task-id>

# Send message to running agent
devsh orchestrate message <task-run-id> "Also update tests" --type request
```

See [skills/devsh-orchestrator/SKILL.md](skills/devsh-orchestrator/SKILL.md) for full documentation.

## License

MIT
