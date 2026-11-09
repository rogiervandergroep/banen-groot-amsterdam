library(tidyverse)

tabel <- read_csv("tabel_lisa_groot_amsterdam.csv") |>
    pivot_longer(cols = starts_with("aantal"))

tabel_sectoren <- read_csv("tabel_lisa_gr_ams_sectoren.csv") |>
    pivot_longer(cols = starts_with("aantal"))

### voor excel ----

tabel_excel <- list(
    totaal = read_csv("tabel_lisa_groot_amsterdam.csv") |>
        select(
            peildatum,
            gemeentenaam,
            gemeentecode,
            `aantal vestigingen`,
            aantal_werkzamepersonen,
            aantal_wp_fulltime,
            aantal_wp_parttime
        ),

    sectoren = read_csv("tabel_lisa_gr_ams_sectoren.csv") |>
        select(
            peildatum,
            sector,
            sbi_2,
            sbi_groep,
            sbi_groep_omschrijving,
            `aantal vestigingen`,
            aantal_werkzamepersonen,
            aantal_wp_fulltime,
            aantal_wp_parttime
        )
)

openxlsx::write.xlsx(tabel_excel, "tab_ban_ves_groot_ams.xlsx", withFilter = T)


# vestigingen
tabel_vestigingen <- tabel |>
    filter(name == 'aantal vestigingen')

tabel_sec_ves <- tabel_sectoren |>
    filter(name == 'aantal vestigingen')

# banen
tabel_banen <- tabel |>
    filter(name == 'aantal_werkzamepersonen')

tabel_sec_ban <- tabel_sectoren |>
    filter(name == 'aantal_werkzamepersonen')


tabel_banen_wp_ft <- tabel |>
    filter(
        name %in%
            c(
                "aantal_wp_fulltime",
                "aantal_wp_parttime"
            )
    )

tabel_banen_vast_uitz <- tabel |>
    filter(
        name %in%
            c(
                "aantal_uitzendkracht",
                "aantal_wp_in_dienst"
            )
    )


grDevices::windowsFonts(
    "Amsterdam Sans" = grDevices::windowsFont("Amsterdam Sans")
)
font <- "Amsterdam Sans"

source(
    "http://gitlab.com/os-amsterdam/tools-onderzoek-en-statistiek/-/raw/main/R/load_all.R"
)


discreet <- c(
    "#004699",
    "#ec0000",
    "#ff9100",
    "#d48fb9",
    "#ffe600",
    "#6cbd74",
    "#009dec"
)

wild_pal <- c(
    "#004699",
    "#009de6",
    "#53b361",
    "#bed200",
    "#ffe600",
    "#ff9100",
    "#ec0000"
)

discreet9 <- c(
    "#e6e6e6",
    "#004699",
    "#009dec",
    "#6cbd74",
    "#bed200",
    "#ffe600",
    "#fdb0cb",
    "#d48fb9",
    "#ff9100",
    "#ec0000"
)

blauw_pal <- c(
    "#004699",
    "#3858a4",
    "#566bb0",
    "#707ebb",
    "#8992c6",
    "#a1a7d2",
    "#b8bcdd",
    "#d0d2e8",
    "#e7e8f4",
    "#e6e6e6"
)


my_plot <- function(x, x_var, y_var, fill_var, color_var, guide_nr = 1) {
    hcl <- farver::decode_colour(color_var, "rgb", "hcl")

    label_col <- ifelse(hcl[, "l"] < 50, "black", "white")

    x |>
        ggplot(aes(
            x = {{ x_var }},
            y = {{ y_var }},
            group = fct_rev({{ fill_var }}),
            fill = fct_rev({{ fill_var }})
        )) +
        geom_col() +

        labs(
            title = NULL,
            x = NULL,
            y = NULL
        ) +

        theme_os(legend_position = "bottom") +
        theme(text = element_text(size = 16)) +

        scale_fill_manual(
            name = NULL,
            values = color_var
        ) +

        guides(
            fill = guide_legend(
                nrow = guide_nr,
                reverse = T
            ),
            colour = "none"
        )
}


tabel_banen |>
    my_plot(
        x_var = peildatum,
        y_var = value,
        fill_var = name,
        color_var = wild_pal
    ) +
    facet_wrap(~gemeentenaam, scales = "free_y")


sectoren <- unique(tabel_sec_ban$sector)


sectoren |>
    map(\(x) {
        filter(tabel_sec_ban, sector == x) |>
            my_plot(
                x_var = peildatum,
                y_var = value,
                fill_var = sbi_2,
                color_var = wild_pal
            )
    })


tabel_vestigingen |>
    my_plot(
        x_var = peildatum,
        y_var = value,
        fill_var = name,
        color_var = wild_pal
    ) +
    facet_wrap(~gemeentenaam, scales = "free_y")


tabel_banen_vast_uitz |>
    my_plot(
        x_var = peildatum,
        y_var = value,
        fill_var = name,
        color_var = wild_pal
    ) +
    facet_wrap(~gemeentenaam, scales = "free_y")


tabel_banen_wp_ft |>
    my_plot(
        x_var = peildatum,
        y_var = value,
        fill_var = name,
        color_var = wild_pal
    ) +
    facet_wrap(~gemeentenaam, scales = "free_y")
