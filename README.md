# review-as-persona

Claude Code slash commands that review your content as specific personas. Not generic feedback with a role label slapped on top. Feedback so persona-accurate that your actual CTO would read it and say "that is exactly what I would say."

## The Problem

You write a blog post, a product page, or an architecture doc. You think it is good. Then your CTO asks where the cost analysis is. Your SRE asks where the failure modes are. Your developer asks where the code examples are. A junior engineer asks what half the acronyms mean.

Every reader walks in with different priorities, different vocabulary, and different patience. This tool shows you what each of them sees before you publish.

## What Makes This Different

Most "review as persona X" tools produce generic feedback with a persona label. The review reads the same regardless of who is supposedly reading it.

These commands use chain-of-thought persona simulation. Before generating any output, the system:

1. **Internalizes the persona's priorities and knowledge level** -- not just their role title, but how they read, what they look for first, and what makes them close the tab
2. **Reads the content through their lens** -- entering the content at the point the persona would actually start (a CTO reads the conclusion first; a developer jumps to code)
3. **Self-critiques before outputting** -- verifying that the feedback is persona-specific, not generic. If swapping the persona label would not change the review, the review gets rewritten

The result: feedback that sounds like the actual person, not a chatbot playing pretend.

## Quick Start

```bash
git clone https://github.com/MarkellR-RedHat/ai-bu-review-as-persona.git
cd ai-bu-review-as-persona
./install.sh
```

This copies commands to `~/.claude/commands/`, persona definitions to `~/.claude/personas/`, and reference files to `~/.claude/reference/`.

## Commands

### Core Reviews

| Command | What It Does |
|---------|-------------|
| `/review-as <persona> <content>` | Single persona review with scorecard, gut reaction, and specific fixes |
| `/review-multi <content>` | All personas at once with a reception matrix and fault-line analysis |
| `/review-for-audience <description> <content>` | Review as a custom audience you describe on the fly |
| `/rewrite-for <persona> <content>` | Full rewrite optimized for a persona's reading patterns and vocabulary |

### Advanced

| Command | What It Does |
|---------|-------------|
| `/debate <content> <persona1> vs <persona2>` | Two personas debate your content, disagree, and a moderator synthesizes |
| `/red-team <content>` | Adversarial review from 4 hostile angles: HN commenter, competitor, newcomer, auditor |
| `/empathy-map <persona> <content>` | Full empathy map: Think, See, Hear, Do, Pain, Gain for a persona reading your content |
| `/persona-builder <description>` | Build and save a custom persona that other commands can reference |

## The "Wow" Moment: Debate

The debate command is the fastest way to see the value. Have your CTO and SRE argue about your content:

```
/debate ./drafts/platform-announcement.md CTO vs SRE
```

Here is what that looks like:

---

### Example: "Scaling AI Inference with Our New Platform" debated by CTO vs SRE

**The Stakes:**
A product announcement covering features, architecture, and performance claims. The CTO evaluates this as a strategic investment decision. The SRE evaluates it as something they will own at 3 AM. These two perspectives pull in opposite directions, and both of them are right.

**CTO's Opening:**
"I see a product announcement that leads with features instead of business outcomes. I need to understand how this fits into our technology strategy and what the total cost of ownership looks like before I can have a conversation with the board. The competitive landscape is completely missing. You are asking me to evaluate this in a vacuum."

**SRE's Opening:**
"I stopped reading at paragraph two. You say 'high availability' but there is no SLO target, no failure mode analysis, and no mention of monitoring. If I am going to own this in production, I need to know what breaks, how I find out it broke, and how I fix it. Right now this reads like a press release, not an operations guide."

**Direct Clash -- Technical Depth vs. Strategic Brevity:**

**CTO:** "We do not need a runbook in the product announcement. This is a strategic document. Lead with the business case, show the competitive comparison, and let the SRE team request the operational docs separately."

**SRE:** "If you ship this without operational specifics, every customer SRE who reads it will assume you do not have them. 'Request the docs separately' means they do not exist yet. Include at minimum: SLO targets, monitoring endpoints, and rollback procedure."

**CTO responds:** "Fine, add an operations summary section. But it goes below the strategic framing, not above it."

**SRE responds:** "Agreed on placement. But the operations summary needs real numbers, not 'high availability.' Give me the SLO target or do not mention availability at all."

**Moderator's Synthesis:**
The SRE has the stronger case on specifics. Vague availability claims without SLO targets actively hurt credibility with both technical and executive audiences. The CTO is right about structure: strategic framing first, operational details second. The recommended changes:

1. **Lead with business outcome** (CTO wins on structure)
2. **Replace "high availability" with actual SLO targets** (SRE wins on substance)
3. **Add a competitive comparison table** (CTO's requirement)
4. **Add an "Operations Overview" section below the fold** with monitoring endpoints, failure modes, and rollback (SRE's requirement)
5. **Hard tradeoff:** The announcement cannot be both a one-page executive brief and an operations reference. Recommendation: keep the announcement strategic with a linked "Operations Guide" for the SRE audience.

---

Both personas exposed gaps that a single review would have missed. The CTO caught the missing business framing. The SRE caught the operational hand-waving. The synthesis turns both sets of concerns into a concrete revision plan.

## Available Personas

| Persona | Key Focus | How They Read |
|---------|-----------|---------------|
| `cto` | Strategy, ROI, vendor risk, TCO | Conclusion first, then architecture, then competitive comparison |
| `sre` | Reliability, failure modes, monitoring, rollback | Ctrl-F for "SLO," "monitoring," "failure modes" |
| `junior-dev` | Working examples, clear explanations, no assumed knowledge | Linearly, start to finish, pausing at every unfamiliar term |
| `technical-writer` | Information architecture, consistency, audience targeting | Structure first (headings, hierarchy), then content |
| `developer-advocate` | DX, shareability, demo potential, authentic voice | As a developer first, then as a communicator |
| `pm` | Customer problem, competitive positioning, adoption metrics | "What problem does this solve?" then customer evidence |
| `solutions-architect` | Integration, reference architectures, production readiness | Architecture diagrams first, then integration points |
| `security-engineer` | Threat model, compliance, data protection, supply chain | Trust boundaries and data flow first |
| `open-source-maintainer` | License, governance, contributor experience, community health | License first, then governance, then contributor metrics |
| `c-suite` | Revenue impact, competitive position, board-ready summary | Executive summary only, 60-90 seconds max |
| `platform-engineer` | Kubernetes-native, multi-tenancy, GitOps, self-service | Kubernetes integration first, then multi-tenancy model |
| `data-scientist` | Benchmarks, reproducibility, compute cost, methodology | Evaluation methodology first, then reproducibility |
| `finance-director` | TCO, ROI, cost predictability, contract terms | Pricing and cost model first |
| `new-hire` | Plain language, definitions, getting-started path, context | Linearly, pausing at every acronym |
| `vp-engineering` | Team impact, adoption curve, operational burden, delivery | Practical team impact first |
| `developer` | Code examples, API design, documentation, DX | Code examples first |

## Build Your Own Persona

Use `/persona-builder` to create a custom persona from a description:

```
/persona-builder A healthcare IT director at a mid-size hospital system who evaluates
AI tools for clinical workflow automation, cares deeply about HIPAA compliance and EHR
integration, has been burned by vendors who overpromise on interoperability
```

This generates a full persona profile and saves it to `~/.claude/personas/` where all other commands can reference it.

## Red Team Your Content

Before you publish, find out how it gets torn apart:

```
/red-team ./drafts/product-announcement.md
```

This runs your content through four hostile readers:
- **Hacker News commenter** -- cynical, well-informed, looking for the weakest claim
- **Competitor's sales team** -- looking for ammunition to use against you
- **Confused newcomer** -- every unexplained acronym is a barrier
- **Security/legal auditor** -- every unsupported claim is a liability

You get a vulnerability report ranked by likelihood and impact, the actual Hacker News comment your content would receive, and specific fixes for every finding.

## Empathy Map Your Audience

Understand not just what a persona thinks about your content, but their full cognitive and emotional experience:

```
/empathy-map sre ./drafts/deployment-guide.md
```

Produces a six-quadrant empathy map (Think, See, Hear, Do, Pain, Gain) grounded in the actual content, plus a reading journey arc showing where engagement rises and drops.

## Output Structure

### Single Persona (`/review-as`)
1. Persona declaration and gut reaction (first person, in character)
2. Scorecard: relevance, clarity, completeness, actionability
3. What they noticed first (based on their reading pattern)
4. What works and why (persona-specific, no generic praise)
5. What fails with concrete fixes
6. Missing information that blocks action
7. Noise to cut
8. Questions they would ask in the meeting
9. Verdict: share, file, or skip

### Debate (`/debate`)
1. Opening statements from both personas
2. What each side champions and rejects
3. Direct clashes where they disagree (with rebuttals)
4. Surprise agreements
5. Moderator's synthesis with recommended changes and hard tradeoffs

### Red Team (`/red-team`)
1. Threat summary and vulnerability report with severity ratings
2. Detailed findings for critical and high severity issues
3. The actual Hacker News comment
4. Competitor rebuttal talking points
5. Newcomer confusion map
6. Security and legal flags
7. Hardening recommendations

### Empathy Map (`/empathy-map`)
1. Think, See, Hear, Do, Pain, Gain quadrants grounded in actual content
2. Reading journey arc with engagement trajectory
3. Key insight the author does not realize
4. Targeted recommendations

## Customizing

Persona definitions live in three places:
- `personas/` in this repo (detailed profiles)
- `reference/personas.md` in this repo (consolidated reference with 15+ personas)
- `~/.claude/personas/` for custom personas built with `/persona-builder`

Edit any of these to match your specific audiences. The commands will load from all three locations.

## License

Apache-2.0
