# review-as-persona

Claude Code commands that review your content from specific persona perspectives. Built for TMMs and PMMs who need to pressure-test messaging before it ships.

## What It Does

You write a blog post, whitepaper, or product page. Before you publish, you want to know: How will a CTO read this? What will an SRE think is missing? Will a developer even finish the first paragraph?

This tool answers those questions by reviewing your content through the lens of twelve common technical personas. Each persona has defined priorities, reading patterns, concerns, and objections based on real-world behavior.

You can also review against a custom audience you describe on the fly, or have the tool rewrite your content so it is optimized for a specific persona.

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
| `finance-director` | Cost, ROI, TCO, budget cycles, contract terms |
| `open-source-maintainer` | Community health, contribution friction, licensing, governance |
| `solutions-architect` | Integration points, reference architectures, production readiness |
| `new-hire` | First-week clarity, no tribal knowledge, plain language |

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

Each review includes a scorecard (1-5 ratings for relevance, clarity, completeness, and persuasiveness), a "would this persona share this?" verdict, section-by-section feedback, and concrete revision suggestions.

### Multi-Persona Review

Review content from all twelve personas at once and get a matrix view:

```
/review-multi ./drafts/product-announcement.md
```

### Custom Audience Review

Review content for a specific audience that is not one of the built-in personas. Describe who they are and what they care about:

```
/review-for-audience A healthcare IT director at a mid-size hospital system who needs to evaluate AI tools for clinical workflow automation, cares about HIPAA compliance and EHR integration --- ./drafts/ai-platform-overview.md
```

### Persona-Optimized Rewrite

Go beyond review. Get your content rewritten so it is optimized for a specific persona:

```
/rewrite-for developer ./drafts/product-announcement.md
```

This produces a full rewrite restructured for the persona's reading patterns, vocabulary, and priorities, along with a change summary table explaining every significant edit.

## Side-by-Side Example: Same Blog Post, Different Personas

Below is the same fictional blog post reviewed by two different personas. This shows how the same content lands completely differently depending on who is reading it.

**The blog post**: "Scaling AI Inference with Our New Platform" (a product announcement covering features, architecture, and performance claims)

---

### CTO Review

**Scorecard**

| Dimension | Score | Reasoning |
|-----------|-------|-----------|
| Relevance | 3/5 | Covers a real need but does not connect to business outcomes clearly enough. |
| Clarity | 4/5 | Well-written, but the strategic framing is buried below feature details. |
| Completeness | 2/5 | Missing TCO analysis, migration path, and competitive comparison. |
| Persuasiveness | 2/5 | Not enough here to bring to the executive team or justify a vendor evaluation. |

**Would this persona share this?** No. "I need to see total cost of ownership, a migration path from our current setup, and evidence from production deployments at our scale. The feature list is fine, but lead with the business outcome. Without a competitive comparison, I cannot tell my board why this is better than the three other platforms we already evaluated."

**Top questions**:
- What is the total cost when we factor in training, migration, and operational overhead?
- How does this fit with our existing inference stack?
- What happens if this vendor changes pricing or direction?
- Where are the production case studies at enterprise scale?

---

### SRE Review

**Scorecard**

| Dimension | Score | Reasoning |
|-----------|-------|-----------|
| Relevance | 3/5 | This is infrastructure I would own, but the content does not speak to my operational reality. |
| Clarity | 2/5 | "High availability" and "cloud-native" are used without any operational specifics. |
| Completeness | 1/5 | No SLO targets, no failure mode analysis, no monitoring guidance, no rollback procedure. |
| Persuasiveness | 1/5 | I would not forward this to my team. I need runbook content, not marketing copy. |

**Would this persona share this?** No. "I stopped reading at paragraph two. You mention 'high availability' but there is no SLO target, no failure mode analysis, and no mention of how I monitor this thing. Where is the rollback procedure? What happens when a model deployment fails mid-rollout? Give me metrics endpoints, alerting guidance, and a graceful degradation story."

**Top questions**:
- What are the failure modes and how do I recover?
- What metrics does this expose? What should I alert on?
- What does rollback look like during a failed model deployment?
- How does this behave under 10x load? Where are the bottlenecks?
- Does this add another thing I have to page for at 3 AM?

---

Both reviews came from the same blog post. The CTO wants strategic framing, competitive context, and ROI data. The SRE wants operational specifics, failure modes, and monitoring hooks. This tool surfaces both sets of gaps before you publish.

## Output Structure

### Single Persona (`/review-as`)

1. **Scorecard** - 1-5 ratings for relevance, clarity, completeness, and persuasiveness with reasoning
2. **Would This Persona Share This?** - Yes/No verdict with explanation
3. **Persona Reaction Summary** - Gut reaction in first person
4. **What This Persona Cares About** - What landed and what missed
5. **Section-by-Section Feedback** - Detailed notes per section
6. **Questions This Persona Would Ask** - Role-specific concerns
7. **What is Missing** - Gaps that block action
8. **What to Cut** - Content that feels like noise to this persona
9. **Suggested Revisions** - 3-5 concrete changes ranked by impact

### Multi-Persona (`/review-multi`)

1. **Audience Reception Matrix** - Table with scores for relevance, clarity, completeness, and persuasiveness per persona, plus a "would share?" column and top concern
2. **Universal Strengths** - What works across audiences
3. **Universal Gaps** - What everyone notices is missing
4. **Persona-Specific Feedback** - Focused bullets per persona
5. **Audience Prioritization** - Who this content currently serves best
6. **Revision Priority List** - Top 5 changes ranked by cross-persona impact

### Custom Audience (`/review-for-audience`)

Same structure as single persona review, but starts with an **Audience Profile** section so you can verify the tool understood your described audience correctly.

### Persona Rewrite (`/rewrite-for`)

1. **Rewrite Strategy** - What structural and framing changes are being made and why
2. **Rewritten Content** - Full rewrite optimized for the persona
3. **Change Summary** - Table of every significant change with reasoning
4. **What is Still Missing** - Gaps that need new information the original did not include

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
