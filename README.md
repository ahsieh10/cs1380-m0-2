# M0: Setup & Centralized Computing
> Full name: `Allison Hsieh`
> Email:  `allison_hsieh@brown.edu`
> Username:  `ahsieh10`

## Summary
> Summarize your implementation, including key challenges you encountered

My implementation comprises `<number>` software components, totaling `<number>` lines of code in the following languages: `<number>` lines of shell scripts and `<number>` of JavaScript code. Key challenges included `trying to understand how to write the ideal output with shell scripting, understanding how to write my own tests, and understanding the concept of stream processing (when I tried to search up shell commands, most of them dealt with files rather than input streams)`.

## Correctness & Performance Characterization
> Describe how you characterized the correctness and performance of your implementation

*Correctness*: My implementation passes `10` out of the `10` tests (`100`%) already provided for M0. I developed another `<number>` tests, which focus on `<..details>`. All these tests, combined take `<time>` to complete. `<additional approaches for increasing correctness confidence>`.

*Performance*: Evaluating the entire system using the `time` command on the three sandboxes reports the following times:

|           | Engine   | Query    |
| --------- | -------- | -------- |
| Sandbox 1 | `1m36.875s` | `0m0.022s` |
| Sandbox 2 | `1m16.933s` | `0m0.111s` |
| Sandbox 3 | `over 125m` | `0m0.288s` |

Regarding the above, I was never able to finish running the engine, as I could not have my computer open for more than 2 consecutive hours. However, the content in global-index looks correct for starters.

## Time to Complete
> Roughly, how many hours did this milestone take you to complete?

Hours: `<time>`

## Wild Guess
> How many lines of code do you think it will take to build the fully distributed, scalable version of your search engine? (If at all possible, try to justify your answer — even a rough justification about the order of magnitude is enough)

DLoC: `10K lines of code, I predict there being a lot of components regarding load balancing, consistency of state and the like.`