library(tidyverse)
library(ggforce)
library(ggdist)
library(distributional)


dist_df = tribble(
  ~distr,  ~mean, ~sd,
  "1. Prior",       2,   1,
  "2. Likelihood",  4,   1.21,
  "3. Posterior", 2.93, 0.713
)

ggplot() +
  stat_slab(data = dist_df, aes(xdist = dist_normal(mean, sd),
                                group = distr, linetype = distr, color = distr),
            fill = NA, show.legend = FALSE) +
  scale_color_manual(values = c("#2780e3","#2780e3", "#F59412")) +
  scale_x_continuous(limits = c(-3, 8)) +
  theme_classic() +
  theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank())

ggsave("lab_logo.svg", width = 4, height = 3, units = "in")
