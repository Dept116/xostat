import React from "react";
import { useTranslation } from "react-i18next";
import { Dropdown } from "react-bootstrap";

import usFlag from "../../assets/img/flags/us.png";
import ruFlag from "../../assets/img/flags/ru.png";
import deFlag from "../../assets/img/flags/de.png";
import esFlag from "../../assets/img/flags/es.png";
import frFlag from "../../assets/img/flags/fr.png";
import plFlag from "../../assets/img/flags/pl.png";
import cnFlag from "../../assets/img/flags/cn.png";
import krFlag from "../../assets/img/flags/kr.png";

interface languageOptionsType {
  [key: string]: {
    icon: string;
    name: string;
  };
}

const languageOptions: languageOptionsType = {
  en: {
    icon: usFlag,
    name: "English",
  },
  ru: {
    icon: ruFlag,
    name: "Pусский",
  },
  de: {
    icon: deFlag,
    name: "Deutsch",
  },
  es: {
    icon: esFlag,
    name: "Español",
  },
  fr: {
    icon: frFlag,
    name: "Français",
  },
  pl: {
    icon: plFlag,
    name: "Polski",
  },
  cn: {
    icon: cnFlag,
    name: "简体中文",
  },
  kr: {
    icon: krFlag,
    name: "한국어",
  },
};

const NavbarLanguages = () => {
  const { i18n } = useTranslation();

  const selectedLanguage = languageOptions[i18n.language];

  return (
    <Dropdown className="me-2 nav-item" align="end">
      <Dropdown.Toggle as="a" className="nav-link nav-flag">
        <img src={selectedLanguage.icon} alt={selectedLanguage.name} />
      </Dropdown.Toggle>
      <Dropdown.Menu>
        {Object.keys(languageOptions).map((language) => (
          <Dropdown.Item
            key={language}
            onClick={() => i18n.changeLanguage(language)}
          >
            <img
              src={languageOptions[language].icon}
              alt="English"
              width="20"
              className="align-middle me-1"
            />
            <span className="align-middle">
              {languageOptions[language].name}
            </span>
          </Dropdown.Item>
        ))}
      </Dropdown.Menu>
    </Dropdown>
  );
};

export default NavbarLanguages;
