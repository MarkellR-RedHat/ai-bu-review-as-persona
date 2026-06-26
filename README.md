# review-as-persona

Claude Code commands that review your content from specific persona perspectives. Built for TMMs and PMMs who need to pressure-test messaging before it ships.

## What It Does

You write a blog post, whitepaper, or product page. Before you publish, you want to know: How will a CTO read this? What will an SRE think is missing? Will a developer even finish the first paragraph?

This tool answers those questions by reviewing your content through the lens of eight common technical personas. Each persona has defined priorities, reading patterns, concerns, and objections based on real-world behavior.

## Available Personas

| Persona | Key Focus |
|---------|-----------|
| `cto` | Strategy, ROI, vendor risk, total cost of ownership |
| `vp-engineering` | Team impact, adoption curve, operational burden |
| `sre` | Reliability, failure modes, monitoring, rollback |
| `developer` | Code examples, API design, documentation, DX |
| `pm` | Customer value, competitive positioning, adoption metrics |
| `security-architect` | Threat model, compliance, data protection, audit |
| `data-scientist` | Benchmarks, reproducibility, compute cost, methodology |
| `platform-engineer` | Kubernetes-native, multi-tenancy, GitOps, self-service |

## Installation

```bash
git clone https://github.com/MarkellR-RedHat/ai-bu-review-as-persona.git
cd ai-bu-review-as-persona
./install.sh
```

This copies the commands to `~/.claude/commands/` and the persona definitions to `~/.claude/personas/`.

## Usage

### Single Persona Review

```
/review-as cto Here is our new blog post about our inference platform...
```

Or point it at a file:

```
/review-as sre ./drafts/deployment-guide.md
```

### Multi-Persona Review

Review content from all eight personas at once and get a matrix view:

```
/review-multi ./drafts/product-announcement.md
```

## Example: CTO vs. SRE on the Same Blog Post

Say you have a blog post titled "Scaling AI Inference with Our New Platform." Here is what you would get from two different personas.

### CTO Review (summary excerpt)

> "This tells me what the platform does, but not why I should care about it over the three other inference platforms my team already evaluated. I need to see total cost of ownership, migration path from our current setup, and evidence from production deployments at our scale. The feature list is fine, but lead with the business outcome."

### SRE Review (summary excerpt)

> "I stopped reading at paragraph two. You mention 'high availability' but there is no SLO target, no failure mode analysis, and no mention of how I monitor this thing. Where is the rollback procedure? What happens when a model deployment fails mid-rollout? I need operational runbook content, not marketing copy."

Both reviews came from the same blog post. The CTO wants strategic framing and ROI. The SRE wants operational specifics and failure modes. This tool surfaces both gaps before you publish.

## Output Structure

### Single Persona (`/review-as`)

1. **Persona Reaction Summary** - Gut reaction in first person
2. **What This Persona Cares About** - What landed and what missed
3. **Section-by-Section Feedback** - Detailed notes per section
4. **Questions This Persona Would Ask** - Role-specific concerns
5. **What is Missing** - Gaps that block action
6. **What to Cut** - Content that feels like noise to this persona
7. **Suggested Revisions** - 3-5 concrete changes with reasoning

### Multi-Persona (`/review-multi`)

1. **Audience Reception Matrix** - Table with reaction, score, and top concern per persona
2. **Universal Strengths** - What works across audiences
3. **Universal Gaps** - What everyone notices is missing
4. **Persona-Specific Feedback** - Focused bullets per persona
5. **Audience Prioritization** - Who this content currently serves best
6. **Revision Priority List** - Top 5 changes ranked by cross-persona impact

## Customizing Personas

Each persona is defined in a markdown file under `personas/`. You can edit these to match your specific audience, or add new personas by creating a new file and updating the command files.

Persona files include:
- Role description
- Priorities
- Reading patterns
- Common concerns
- What makes them stop reading
- What wins them over

## License

Apache-2.0
