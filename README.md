# review-as-persona

You wrote a blog post. You think it is good. But will your CTO think it is strategic enough? Will the SRE team think it is technically credible? Will a junior dev actually understand it? Will the finance director find a single number worth caring about?

You cannot get five different people to review every piece of content. But you need that perspective diversity before you publish.

These Claude Code slash commands do not give you generic feedback with a role label slapped on top. They give you feedback so persona-accurate that your actual CTO would read it and say "that is exactly what I would say."

## Why This Exists

Every reader walks in with a different cognitive style. A CTO scans for strategic relevance in 90 seconds and decides whether your content deserves 15 more minutes. An SRE Ctrl-F's for "SLO," "monitoring," and "failure modes," and if none of those words appear, your content has already failed. A junior developer reads every word because they do not know what is safe to skip, and they panic at every undefined acronym. A finance director looks for dollar signs and skips everything else.

These are not "different priorities." They are fundamentally different ways of reading. A single review cannot surface what all of them see. This tool can.

## What Makes This Different

Most "review as persona X" prompts produce the same review with a different label. Swap "CTO" for "SRE" and the feedback barely changes.

These commands use chain-of-thought persona inhabitation. Before generating any output, the system:

1. **Adopts the persona's cognitive style** -- not just their role title, but how they physically move through content, what their eyes land on first, and what makes them close the tab
2. **Finds the persona's hidden insecurity** -- the fear that shapes everything they notice. A CTO worries about recommending something that fails publicly. An SRE worries about being woken at 3 AM by something they said was production-ready.
3. **Self-critiques before outputting** -- if swapping the persona label would not change the review, the review gets rewritten from scratch

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
| `/review-as <persona> <content>` | Single persona review with gut reaction, scorecard, and specific fixes |
| `/review-multi <content>` | All personas at once with a reception matrix and fault-line analysis |
| `/review-for-audience <description> <content>` | Review as a custom audience you describe on the fly |
| `/rewrite-for <persona> <content>` | Full rewrite as a different document type native to the persona |

### Advanced

| Command | What It Does |
|---------|-------------|
| `/debate <content> <persona1> vs <persona2>` | Two personas fight about your content. Real friction, not polite disagreement. |
| `/red-team <content>` | Adversarial review from 4 hostile angles. Designed to make you uncomfortable. |
| `/empathy-map <persona> <content>` | Full empathy map: Think, See, Hear, Do, Pain, Gain for a persona reading your content |
| `/persona-builder <description>` | Build and save a custom persona with cognitive style, decision patterns, and hidden insecurities |

## See It In Action: The Debate Command

The debate command is the fastest way to feel the value. Have your CTO and SRE argue about your content:

```
/debate ./drafts/platform-announcement.md CTO vs SRE
```

Here is what that produces:

---

### "Scaling AI Inference with Our New Platform" -- CTO vs SRE

**The Stakes:**
A product announcement covering features, architecture, and performance claims. The CTO evaluates this as a strategic investment decision. The SRE evaluates it as something they will own at 3 AM. These two personas do not have "different perspectives." They need fundamentally incompatible documents, and the author has to choose.

**CTO's Opening:**
"I see a product announcement that leads with features instead of business outcomes. I have four proposals on my desk this week. Tell me in two sentences why this is a better strategic bet than what we already run. The competitive landscape is completely missing. You are asking me to evaluate this in a vacuum."

**SRE's Opening:**
"I stopped reading at paragraph two. You say 'high availability' but there is no SLO target, no failure mode analysis, and no mention of monitoring. If I am going to own this in production, I need to know what breaks, how I find out it broke, and how I fix it. Right now this reads like a press release, not an operations guide."

**The Direct Clash -- Technical Depth vs. Strategic Brevity:**

**CTO:** "We do not need a runbook in the product announcement. This is a strategic document. Lead with the business case, show the competitive comparison, and let the SRE team request the operational docs separately."

**SRE:** "If you ship this without operational specifics, every customer SRE who reads it will assume you do not have them. 'Request the docs separately' means they do not exist yet. Include at minimum: SLO targets, monitoring endpoints, and rollback procedure."

**CTO responds:** "Fine, add an operations summary section. But it goes below the strategic framing, not above it."

**SRE responds:** "Agreed on placement. But the operations summary needs real numbers, not 'high availability.' Give me the SLO target or do not mention availability at all."

**The Question Nobody Is Asking:**
Neither persona is surfacing the real problem: this announcement is trying to serve two audiences that need two different documents. No amount of section ordering solves a document that is simultaneously a board-ready brief and an operational reference. The author needs to choose a primary audience and link to the other.

**Moderator's Synthesis:**
The SRE has the stronger case on specifics. Vague availability claims without SLO targets actively hurt credibility with both audiences. The CTO is right about structure: strategic framing first. The recommended approach:

1. **Choose the primary audience** (CTO wins on this being a strategic announcement)
2. **Replace "high availability" with the actual SLO target** (SRE wins on substance)
3. **Add a competitive comparison table** (CTO's requirement, and the SRE does not object)
4. **Create a separate "Operations Guide" linked from the announcement** (resolves the irreconcilable tension)
5. **Hard tradeoff:** The announcement cannot be both. Make it strategic. Link to the operational details.

---

Both personas exposed gaps that a single review would have missed entirely. The CTO caught the missing business framing. The SRE caught the operational hand-waving. The moderator named the structural problem neither of them surfaced.

## Red-Team Your Content

Before you publish, find out how it gets torn apart:

```
/red-team ./drafts/product-announcement.md
```

This runs your content through four hostile readers:
- **The Hacker News commenter** -- writes the actual devastating top comment your content would receive, complete with a snarky reply and a polite-but-devastating technical rebuttal
- **The competitor's sales team** -- crafts actual battle card talking points to use against you
- **The confused newcomer** -- documents the exact moment they stopped reading and why
- **The security/legal auditor** -- finds the claim on line 14 that could become a liability

You get a vulnerability report with severity ratings (including "Show-Stopper" for things that should block publication), the actual Hacker News comment thread, and specific fixes for every finding.

## Available Personas

| Persona | Cognitive Style | How They Read |
|---------|----------------|---------------|
| `cto` | Systems thinker, portfolio risk | Conclusion first, then architecture, 90-second first pass |
| `sre` | Failure-mode thinker | Ctrl-F for "SLO," "monitoring," "failure modes" |
| `developer` | Practical thinker | Code examples first, tries the quickstart before reading |
| `junior-dev` | Sequential learner | Every word, top to bottom, panics at undefined acronyms |
| `technical-writer` | Structural thinker | Table of contents first, then terminology consistency |
| `developer-advocate` | Story thinker | Looks for the hook, then tries to run the demo |
| `pm` | Customer-centric thinker | "What problem does this solve?" then customer evidence |
| `solutions-architect` | Integration thinker | Architecture diagrams first, then integration points |
| `security-engineer` | Adversarial thinker | Trust boundaries and data flow first |
| `open-source-maintainer` | Community thinker | License first, then governance, then contributor metrics |
| `c-suite` | Outcome thinker | Executive summary only, 60-90 seconds max |
| `platform-engineer` | Abstraction thinker | Kubernetes integration first, then multi-tenancy model |
| `data-scientist` | Evidence thinker | Evaluation methodology first, then reproducibility |
| `finance-director` | Numbers thinker | Pricing and cost model first |
| `new-hire` | Context-seeking thinker | Linearly, pausing at every acronym |
| `vp-engineering` | Team-impact thinker | Practical team impact first |

## Build Your Own Persona

Use `/persona-builder` to create a custom persona from a description:

```
/persona-builder A healthcare IT director at a mid-size hospital system who evaluates
AI tools for clinical workflow automation, cares deeply about HIPAA compliance and EHR
integration, has been burned by vendors who overpromise on interoperability
```

This generates a full behavioral model including cognitive style, hidden insecurity, decision pattern, and the phrases they actually use in meetings. The persona is saved to `~/.claude/personas/` where all other commands can reference it.

## Empathy Map Your Audience

Understand not just what a persona thinks about your content, but their full cognitive and emotional journey:

```
/empathy-map sre ./drafts/deployment-guide.md
```

Produces a six-quadrant empathy map (Think, See, Hear, Do, Pain, Gain) grounded in the actual content. Pain points are categorized by type (confusion, frustration, distrust, boredom, feeling talked down to, feeling excluded) because each type requires a different fix. Includes the exact moment where the reader either commits to finishing or decides to bail.

## Customizing

Persona definitions live in three places:
- `personas/` in this repo (detailed profiles with cognitive style and insecurities)
- `reference/personas.md` in this repo (consolidated behavioral psychology guide with all 16 personas)
- `~/.claude/personas/` for custom personas built with `/persona-builder`

Edit any of these to match your specific audiences. The commands will load from all three locations.

## License

Apache-2.0
