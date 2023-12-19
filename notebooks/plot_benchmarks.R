library(tidyverse)
library(viridis)
df <- read_csv("notebooks/results_cardiac_random_10_cardiac15678.csv")

cardiac_descriptions_df <- data.frame(
  dataset = c("cardiac1", "cardiac2", "cardiac3", "cardiac4", "cardiac5",
            "cardiac6", "cardiac7", "cardiac8", "cardiac9", "cardiac10",
            "cardiac11", "cardiac12"),
  description = c("Atrial Ionic", "Atrial Isotonic Contraction",
                  "Atrial Isometric Stretch 1.0", "Atrial Isometric Stretch 1.1",
                  "CircAdap", "Fourchamber Model", "Passive Mechanics",
                  "Tissue Electrophysiology", "Ventricular Ionic",
                  "Ventricular Isotonic Contraction",
                  "Ventricular Isometric Stretch 1.0",
                  "Ventricular Isometric Stretch 1.1")
) %>%
as_tibble()

df %>%
    filter(metric == "r2") %>%
    mutate(dataset = str_extract(path, "cardiac[0-9]+"))  %>%
    select(-path, -metric) %>%
    group_by(dataset, model) %>%
    summarise(mean_r2 = mean(score), sd_r2 = sd(score)) %>%
    mutate(mean_r2 = ifelse(mean_r2 < 0, 0, mean_r2))  %>%
    arrange(dataset, desc(mean_r2)) -> df_plot

df_plot <- df_plot %>%
    left_join(cardiac_descriptions_df)

ggplot(df_plot, aes(description, mean_r2, fill = model)) +
  geom_bar(stat = "identity", position="dodge") +
  theme_minimal()+
  scale_fill_viridis_d()  +
  # angle the x-axis labels
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(df_plot, aes(x = reorder(dataset, mean_r2), y = mean_r2, fill = model)) +
    geom_bar(stat = "identity", position = "dodge") +
    #geom_errorbar(aes(ymin = mean_r2 - sd_r2, ymax = mean_r2 + sd_r2), width = 0.2, position = position_dodge(0.9)) +
    labs(x = "Dataset", y = "R2", fill = "Model") +
    theme_bw()

#ggsave("notebooks/plot_cardiac_random_10_cardiac15678.jpg", p, width = 6, height = 4)



