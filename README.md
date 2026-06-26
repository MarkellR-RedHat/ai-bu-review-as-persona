# review-as-persona

**Get the feedback five different readers would give you, without chasing five different people.**

You wrote a blog post, a product announcement, or an architecture doc. You think it is solid. But your CTO reads for strategic relevance in 90 seconds. Your SRE Ctrl-F's for "SLO" and closes the tab if it is missing. Your junior dev panics at undefined acronyms. Your finance director looks for dollar signs and ignores everything else.

These are not "different priorities." They are fundamentally different ways of reading. A single reviewer cannot surface what all of them see.

This tool can.

## Before and After

**Before:** You share your draft in Slack. One person responds "looks good." You publish. The SRE team asks why there is no SLO target. The CTO asks why there is no competitive comparison. The junior dev DMs you to ask what "idempotent" means.

**After:**

```
/review-as sre ./drafts/platform-announcement.md
```

```
GUT REACTION: I stopped reading at paragraph two. You say "high availability"
but there is no SLO target, no failure mode analysis, and no mention of
monitoring. If I am going to own this in production, I need to know what breaks,
how I find out it broke, and how I fix it.

SCORECARD:
  Operational clarity    2/5  -- no SLOs, no runbook, no monitoring story
  Failure mode coverage  1/5  -- "high availability" with zero specifics
  On-call readiness      1/5  -- would not pass an ops review

TOP FIXES:
  1. Replace "high availability" with the actual SLO target (e.g., 99.95%)
  2. Add a failure mode table: what breaks, blast radius, detection, mitigation
  3. Link to or embed the monitoring dashboard and alerting config
```

That review came back in seconds, not days. And it sounds like your actual SRE, not a chatbot with a role label.

## Quick Start

```bash
git clone https://github.com/MarkellR-RedHat/ai-bu-review-as-persona.git
cd ai-bu-review-as-persona
./install.sh
```

Then try this immediately:

```
/debate ./README.md CTO vs SRE
```

Two personas argue about your content. Real friction, not polite disagreement. It is the fastest way to feel the value.

## Commands

### Core Reviews

| Command | What It Does |
|---------|-------------|
| `/review-as <persona> <content>` | Single persona review with gut reaction, scorecard, and specific fixes |
| `/review-multi <content>` | All personas review at once with a reception matrix and fault-line analysis |
| `/review-for-audience <desc> <content>` | Review as a custom audience you describe on the fly |
| `/rewrite-for <persona> <content>` | Full rewrite as a document type native to the persona |

### Advanced

| Command | What It Does |
|---------|-------------|
| `/debate <content> <persona1> vs <persona2>` | Two personas fight about your content with real friction |
| `/red-team <content>` | Adversarial review from 4 hostile angles designed to find blind spots |
| `/empathy-map <persona> <content>` | Full empathy map: Think, See, Hear, Do, Pain, Gain |
| `/persona-builder <description>` | Build and save a custom persona with cognitive style and decision patterns |

## Available Personas

| Persona | How They Read |
|---------|---------------|
| `cto` | Conclusion first, then architecture, 90-second decision window |
| `sre` | Ctrl-F for "SLO," "monitoring," "failure modes" |
| `developer` | Code examples first, tries the quickstart before reading anything else |
| `junior-dev` | Every word top to bottom, panics at undefined acronyms |
| `technical-writer` | Table of contents first, then terminology consistency |
| `developer-advocate` | Looks for the hook, then tries to run the demo |
| `pm` | "What problem does this solve?" then customer evidence |
| `solutions-architect` | Architecture diagrams first, then integration points |
| `security-engineer` | Trust boundaries and data flow first |
| `open-source-maintainer` | License first, then governance, then contributor metrics |
| `c-suite` | Executive summary only, 60-90 seconds max |
| `platform-engineer` | Kubernetes integration first, then multi-tenancy model |
| `data-scientist` | Evaluation methodology first, then reproducibility |
| `finance-director` | Pricing and cost model first |
| `new-hire` | Linearly, pausing at every acronym |
| `vp-engineering` | Practical team impact first |

You can also build your own:

```
/persona-builder A healthcare IT director at a mid-size hospital who evaluates
AI tools for clinical workflow automation, has been burned by vendors who
overpromise on interoperability
```

## How It Works

Most "review as persona X" prompts produce the same review with a different label. Swap "CTO" for "SRE" and the feedback barely changes.

These commands use chain-of-thought persona inhabitation. Before generating any output, the system:

1. **Adopts the persona's cognitive style** -- not just their role title, but how they physically move through content, what their eyes land on first, and what makes them close the tab
2. **Finds the persona's hidden insecurity** -- the fear that shapes everything they notice. A CTO worries about recommending something that fails publicly. An SRE worries about getting paged at 3 AM by something they said was production-ready.
3. **Self-critiques before outputting** -- if swapping the persona label would not change the review, the review gets rewritten from scratch

## Customizing

Persona definitions live in three places:

- `personas/` in this repo (detailed profiles with cognitive style and insecurities)
- `reference/personas.md` in this repo (consolidated behavioral psychology guide)
- `~/.claude/personas/` for custom personas you build with `/persona-builder`

Edit any of these to match your specific audiences. The commands load from all three locations.

## License

Apache-2.0
