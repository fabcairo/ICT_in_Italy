#setwd(choose.dir(default = "", caption = "WHERE ARE MICRODATA?"))

direttorio = getwd()
fileInput = paste (direttorio, "/ICT_Microdati_2018.txt", sep="")
DF_ICT_A2018<- read.delim2 (fileInput,  header=T, sep="	",  quote="",  na.strings = ".")
varlab <- c(
"Codice progressivo",
"Classe di ricavi da vendita di beni e servizi",
"Percentuale di addetti che usano il computer sul totale degli addetti",
"Impiego di addetti specialisti in materie informatiche",
"Corsi di formazione IT destinati agli addetti con competenze specialistiche in ICT",
"Corsi di formazione IT destinati agli addetti senza competenze specialistiche in ICT",
"Ha assunto o ha provato ad assumere specialisti ICT",
"Difficolta' a coprire i posti vacanti per specialisti ICT",
"Utilizzo prevalente di persone che fanno parte del gruppo di imprese o esterne per Manutenzione delle infrastrutture ICT",
"Utilizzo prevalente di persone che fanno parte del gruppo di imprese o esterne per Supporto per i software di ufficio",
"Utilizzo prevalente di persone che fanno parte del gruppo di imprese o esterne per Sviluppo di sistemi e di software di gestione aziendale",
"Utilizzo prevalente di persone che fanno parte del gruppo di imprese o esterne per Supporto per software e sistemi di gestione aziendale",
"Utilizzo prevalente di persone che fanno parte del gruppo di imprese o esterne per Sviluppo web",
"Utilizzo prevalente di persone che fanno parte del gruppo di imprese o esterne per Supporto per lo sviluppo web",
"Utilizzo prevalente di persone che fanno parte del gruppo di imprese o esterne per Gestione della sicurezza ICT e protezione dei dati",
"Connessione ad Internet",
"Percentuale di addetti che usano computer connessi Internet sul totale degli addetti",
"Tipo di connessione: fissa in banda larga  -  DSL (xDSL, ADSL, SDSL, VDSL, ecc.), via cavo, fibre ottiche (FTTH), connessioni fisse senza fili, WiFi (anche pubbliche), WiMax",
"Velocita' max download connessione fissa in banda larga",
"L'impresa fornisce dispositivi portatili con connessione mobile",
"Percentuale di addetti provvisti di dispositivi portatili forniti dall'impresa che permettono la connessione mobile ad Internet  (in banda larga o meno) sul totale degli addetti",
"connessione mobile per: accedere a sistema di posta elettronica aziendale",
"connessione mobile per: accedere e modificare documenti aziendali",
"connessione mobile per: utilizzare di specifiche applicazioni software aziendali",
"Sito web",
"Possibilita' di effettuare ordinazioni o prenotazioni on line (es. carrello della spesa on line)",
"Tracciabilita' on line dell'ordine",
"Accesso a cataloghi di prodotti o listini prezzi",
"Possibilita' di personalizzare i contenuti del sito per i visitatori abituali",
"Possibilita' per i visitatori del sito di personalizzare o progettare prodotti",
"Collegamenti o riferimenti ai profili dell'impresa sui social media",
"Pubblicita' a pagamento su Internet",
"Pubblicita a pagamento su Internet, metodi di pubblicita' mirata: ricerca contenuti web",
"Pubblicita a pagamento su Internet, metodi di pubblicita' mirata: tracciabilita' degli utenti",
"Pubblicita a pagamento su Internet, metodi di pubblicita' mirata: geolocalizzazione degli utenti",
"Pubblicita a pagamento su Internet, metodi di pubblicita' mirata: altri metodi",
"Adempimenti e procedure per il lavoro (INPS/INAIL): Procedure elettroniche troppo complicate e dispendiose in termini di tempo",
"Adempimenti e procedure per il lavoro (INPS/INAIL): Procedure elettroniche che richiedono ancora la presentazione di documenti cartacei",
"Adempimenti e procedure per il lavoro (INPS/INAIL): Difficolta' tecniche dipendenti dal sito web/portale (interruzioni procedure, procedure lente)",
"Adempimenti e procedure per il lavoro (INPS/INAIL): Informazioni insufficienti o poco chiare; mancanza di supporto",
"Adempimenti e procedure per il lavoro (INPS/INAIL): Timori legati alla sicurezza o alla riservatezza dei dati",
"Adempimenti e procedure per il lavoro (INPS/INAIL): Nessun problema nell'utilizzo del servizio offerto on-line dalla PA",
"Adempimenti e procedure per il lavoro (INPS/INAIL): L'impresa non utilizza il servizio e/o si avvale di un intermediario (commercialista, CAF, altra impresa del gruppo, ecc.)",
"Dichiarazione dei redditi dell'impresa: Procedure elettroniche troppo complicate e dispendiose in termini di tempo",
"Dichiarazione dei redditi dell'impresa: Procedure elettroniche che richiedono ancora la presentazione di documenti cartacei",
"Dichiarazione dei redditi dell'impresa: Difficolta' tecniche dipendenti dal sito web/portale (interruzioni procedure, procedure lente)",
"Dichiarazione dei redditi dell'impresa: Informazioni insufficienti o poco chiare; mancanza di supporto",
"Dichiarazione dei redditi dell'impresa: Timori legati alla sicurezza o alla riservatezza dei dati",
"Dichiarazione dei redditi dell'impresa: Nessun problema nell'utilizzo del servizio offerto on-line dalla PA",
"Dichiarazione dei redditi dell'impresa: L'impresa non utilizza il servizio e/o si avvale di un intermediario (commercialista, CAF, altra impresa del gruppo, ecc.)",
"Dichiarazione IVA: Procedure elettroniche troppo complicate e dispendiose in termini di tempo",
"Dichiarazione IVA: Procedure elettroniche che richiedono ancora la presentazione di documenti cartacei",
"Dichiarazione IVA: Difficolta' tecniche dipendenti dal sito web/portale (interruzioni procedure, procedure lente)",
"Dichiarazione IVA: Informazioni insufficienti o poco chiare; mancanza di supporto",
"Dichiarazione IVA: Timori legati alla sicurezza o alla riservatezza dei dati",
"Dichiarazione IVA: Nessun problema nell'utilizzo del servizio offerto on-line dalla PA",
"Dichiarazione IVA: L'impresa non utilizza il servizio e/o si avvale di un intermediario (commercialista, CAF, altra impresa del gruppo, ecc.)",
"Sportello Unico per le attivita' Produttive (permessi di costruire, dichiarazione di inizio attivita', ecc): Procedure elettroniche troppo complicate e dispendiose in termini di tempo",
"Sportello Unico per le attivita' Produttive (permessi di costruire, dichiarazione di inizio attivita', ecc): Procedure elettroniche che richiedono ancora la presentazione di documenti cartacei",
"Sportello Unico per le attivita' Produttive (permessi di costruire, dichiarazione di inizio attivita', ecc): Difficolta' tecniche dipendenti dal sito web/portale (interruzioni procedure, procedure len",
"Sportello Unico per le attivita' Produttive (permessi di costruire, dichiarazione di inizio attivita', ecc): Informazioni insufficienti o poco chiare; mancanza di supporto",
"Sportello Unico per le attivita' Produttive (permessi di costruire, dichiarazione di inizio attivita', ecc): Timori legati alla sicurezza o alla riservatezza dei dati",
"Sportello Unico per le attivita' Produttive (permessi di costruire, dichiarazione di inizio attivita', ecc): Nessun problema nell'utilizzo del servizio offerto on-line dalla PA",
"Sportello Unico per le attivita' Produttive (permessi di costruire, dichiarazione di inizio attivita', ecc): L'impresa non utilizza il servizio e/o si avvale di un intermediario (commercialista, CAF, ",
"Adempimenti e procedure in materia edilizia: Procedure elettroniche troppo complicate e dispendiose in termini di tempo",
"Adempimenti e procedure in materia edilizia: Procedure elettroniche che richiedono ancora la presentazione di documenti cartacei",
"Adempimenti e procedure in materia edilizia: Difficolta' tecniche dipendenti dal sito web/portale (interruzioni procedure, procedure lente)",
"Adempimenti e procedure in materia edilizia: Informazioni insufficienti o poco chiare; mancanza di supporto",
"Adempimenti e procedure in materia edilizia: Timori legati alla sicurezza o alla riservatezza dei dati",
"Adempimenti e procedure in materia edilizia: Nessun problema nell'utilizzo del servizio offerto on-line dalla PA",
"Adempimenti e procedure in materia edilizia: L'impresa non utilizza il servizio e/o si avvale di un intermediario (commercialista, CAF, altra impresa del gruppo, ecc.)",
"Dichiarazioni doganali (dazi, accise), comunicazioni Intrastat: Procedure elettroniche troppo complicate e dispendiose in termini di tempo",
"Dichiarazioni doganali (dazi, accise), comunicazioni Intrastat: Procedure elettroniche che richiedono ancora la presentazione di documenti cartacei",
"Dichiarazioni doganali (dazi, accise), comunicazioni Intrastat: Difficolta' tecniche dipendenti dal sito web/portale (interruzioni procedure, procedure lente)",
"Dichiarazioni doganali (dazi, accise), comunicazioni Intrastat: Informazioni insufficienti o poco chiare; mancanza di supporto",
"Dichiarazioni doganali (dazi, accise), comunicazioni Intrastat: Timori legati alla sicurezza o alla riservatezza dei dati",
"Dichiarazioni doganali (dazi, accise), comunicazioni Intrastat: Nessun problema nell'utilizzo del servizio offerto on-line dalla PA",
"Dichiarazioni doganali (dazi, accise), comunicazioni Intrastat: L'impresa non utilizza il servizio e/o si avvale di un intermediario (commercialista, CAF, altra impresa del gruppo, ecc.)",
"Partecipazioni a gare d'appalto e bandi on-line della PA: Procedure elettroniche troppo complicate e dispendiose in termini di tempo",
"Partecipazioni a gare d'appalto e bandi on-line della PA: Procedure elettroniche che richiedono ancora la presentazione di documenti cartacei",
"Partecipazioni a gare d'appalto e bandi on-line della PA: Difficolta' tecniche dipendenti dal sito web/portale (interruzioni procedure, procedure lente)",
"Partecipazioni a gare d'appalto e bandi on-line della PA: Informazioni insufficienti o poco chiare; mancanza di supporto",
"Partecipazioni a gare d'appalto e bandi on-line della PA: Timori legati alla sicurezza o alla riservatezza dei dati",
"Partecipazioni a gare d'appalto e bandi on-line della PA: Nessun problema nell'utilizzo del servizio offerto on-line dalla PA",
"Partecipazioni a gare d'appalto e bandi on-line della PA: L'impresa non utilizza il servizio e/o si avvale di un intermediario (commercialista, CAF, altra impresa del gruppo, ecc.)",
"Utilizzo della fatturazione elettronica con la PA: Procedure elettroniche troppo complicate e dispendiose in termini di tempo",
"Utilizzo della fatturazione elettronica con la PA: Procedure elettroniche che richiedono ancora la presentazione di documenti cartacei",
"Utilizzo della fatturazione elettronica con la PA: Difficolta' tecniche dipendenti dal sito web/portale (interruzioni procedure, procedure lente)",
"Utilizzo della fatturazione elettronica con la PA: Informazioni insufficienti o poco chiare; mancanza di supporto",
"Utilizzo della fatturazione elettronica con la PA: Timori legati alla sicurezza o alla riservatezza dei dati",
"Utilizzo della fatturazione elettronica con la PA: Nessun problema nell'utilizzo del servizio offerto on-line dalla PA",
"Utilizzo della fatturazione elettronica con la PA: L'impresa non utilizza il servizio e/o si avvale di un intermediario (commercialista, CAF, altra impresa del gruppo, ecc.)",
"Utilizzo della PEC per interagire con la PA: Procedure elettroniche troppo complicate e dispendiose in termini di tempo",
"Utilizzo della PEC per interagire con la PA: Procedure elettroniche che richiedono ancora la presentazione di documenti cartacei",
"Utilizzo della PEC per interagire con la PA: Difficolta' tecniche dipendenti dal sito web/portale (interruzioni procedure, procedure lente)",
"Utilizzo della PEC per interagire con la PA: Informazioni insufficienti o poco chiare; mancanza di supporto",
"Utilizzo della PEC per interagire con la PA: Timori legati alla sicurezza o alla riservatezza dei dati",
"Utilizzo della PEC per interagire con la PA: Nessun problema nell'utilizzo del servizio offerto on-line dalla PA",
"Utilizzo della PEC per interagire con la PA: L'impresa non utilizza il servizio e/o si avvale di un intermediario (commercialista, CAF, altra impresa del gruppo, ecc.)",
"Utilizzo di servizi di cloud computing su Internet",
"Tipologia servizi cloud utilizzati: servizi di posta elettronica",
"Tipologia servizi cloud utilizzati: software per ufficio",
"Tipologia servizi cloud utilizzati: hosting di database dell'impresa",
"Tipologia servizi cloud utilizzati: archiviazione di file",
"Tipologia servizi cloud utilizzati: applicazioni software di finanza e contabilita'",
"Tipologia servizi cloud utilizzati: applicazioni software CRM per gestire le informazioni relative ai propri clienti",
"Tipologia servizi cloud utilizzati: potenza di calcolo per eseguire il software dell'impresa",
"Tipologia di fornitura di servizi cloud: server condivisi (cloud pubblico)",
"Tipologia di fornitura di servizi cloud: server riservati (cloud privato)",
"Utilizzo di stampanti 3D di proprieta', affittate o prese in leasing dall'impresa",
"Utilizzo di servizi di stampa 3D forniti da altre imprese diverse dalla rispondente",
"stampare in 3D prototipi o modelli da vendere",
"stampare in 3D prototipi o modelli per uso interno all'impresa",
"stampare in 3D beni da vendere esclusi prototipi o modelli",
"stampare in 3D beni da utilizzare nel processo di produzione della vostra impresa escluso prototipi o modelli",
"Robot industriali",
"Robot di servizio",
"Robot di servizio: compiti di sorveglianza, sicurezza o ispezione",
"Robot di servizio: trasporto di persone o beni",
"Robot di servizio: attivita' di pulizia o di smaltimento dei rifiuti",
"Robot di servizio: sistemi di gestione del magazzino",
"Robot di servizio: lavori di assemblaggio",
"Robot di servizio: compiti da impiegato di un negozio robotizzato",
"Robot di servizio: lavori di costruzione o riparazione di danni",
"Big Data Analisys - fonti di dati: dispositivi intelligenti o sensori",
"Big Data Analisys - fonti di dati: geolocalizzazione derivante dall'utilizzo di dispositivi portatili",
"Big Data Analisys - fonti di dati: social media",
"Big Data Analisys - fonti di dati: altro",
"Big Data Analisys: personale interno",
"Big Data Analisys: personale esterno",
"Fatture elettroniche adatte B2B e B2C",
"Fatture elettroniche adatte B2G",
"Fatture in formato elettronico non adatte",
"Fatture cartacee",
"Classe percentuale delle fatture elettroniche inviate in formato standard",
"Vendite web: tramite siti web o app dell'impresa",
"Vendite web: tramite siti web di intermediari ovvero siti di ecommerce (marketplace) o app",
"Classe percentuale degli ordini di vendita sito web rispetto al totale dei ricavi",
"Percentuale delle vendite web destinate a consumatori privati (B2C)",
"Percentuale delle vendite web destinate ad altre imprese (B2B) o alla Pubblica Amministrazione (B2G)",
"Vendite web: tramite siti web o app dell'impresa",
"Vendite web: tramite siti web di intermediari ovvero siti di ecommerce (marketplace) o app",
"Ordini di vendita attraverso sistemi di tipo EDI",
"Classe percentuale degli ordini di vendita via EDI rispetto al totale dei ricavi",
"Investimenti 2016: Soluzioni di Internet delle cose o IoT (ad es. Rfid, sensori, oggetti conne",
"Investimenti 2017: Soluzioni di Internet delle cose o IoT (ad es. Rfid, sensori, oggetti conne",
"Nessun investimento 2016-2017: Soluzioni di Internet delle cose o IoT (ad es. Rfid, sensori, oggetti conne",
"Investimenti 2016: Stampa 3D",
"Investimenti 2017: Stampa 3D",
"Nessun investimento 2016-2017: Stampa 3D",
"Investimenti 2016: Robotica (robot industriali, robot collaborativi interconnessi e programmabili)",
"Investimenti 2017: Robotica (robot industriali, robot collaborativi interconnessi e programmabili)",
"Nessun investimento 2016-2017: Robotica (robot industriali, robot collaborativi interconnessi e programmabili)",
"Investimenti 2016: Altri beni strumentali computerizzati o gestiti tramite sensori e interconnessi con altri sistemi aziendali",
"Investimenti 2017: Altri beni strumentali computerizzati o gestiti tramite sensori e interconnessi con altri sistemi aziendali",
"Nessun investimento 2016-2017: Altri beni strumentali computerizzati o gestiti tramite sensori e interconnessi con altri sistemi aziendali",
"Investimenti 2016: Cloud Computing (insieme di servizi informatici utilizzabili tramite Internet che consentono l'accesso a software, potenza di calcolo, capacita' di memoria, ecc.)",
"Investimenti 2017: Cloud Computing (insieme di servizi informatici utilizzabili tramite Internet che consentono l'accesso a software, potenza di calcolo, capacita' di memoria, ecc.)",
"Nessun investimento 2016-2017: Cloud Computing (insieme di servizi informatici utilizzabili tramite Internet che consentono l'accesso a software, potenza di calcolo, capacita' di memoria, ecc.)",
"Investimenti 2016: Applicazioni web o app (applicazioni accessibili via Internet comprese quelle gestionali)",
"Investimenti 2017: Applicazioni web o app (applicazioni accessibili via Internet comprese quelle gestionali)",
"Nessun investimento 2016-2017: Applicazioni web o app (applicazioni accessibili via Internet comprese quelle gestionali)",
"Investimenti 2016: Vendite online",
"Investimenti 2017: Vendite online",
"Nessun investimento 2016-2017: Vendite online",
"Investimenti 2016: Big Data Analytics (uso di tecniche, tecnologie e software per l'analisi di grandi quantita' di dati)",
"Investimenti 2017: Big Data Analytics (uso di tecniche, tecnologie e software per l'analisi di grandi quantita' di dati)",
"Nessun investimento 2016-2017: Big Data Analytics (uso di tecniche, tecnologie e software per l'analisi di grandi quantita' di dati)",
"Investimenti 2016: Realta' aumentata e realta' virtuale",
"Investimenti 2017: Realta' aumentata e realta' virtuale",
"Nessun investimento 2016-2017: Realta' aumentata e realta' virtuale",
"Investimenti 2016: Sicurezza informatica",
"Investimenti 2017: Sicurezza informatica",
"Nessun investimento 2016-2017: Sicurezza informatica",
"Investimenti 2018: Soluzioni di Internet delle cose o IoT (ad es. Rfid, sensori, oggetti conne",
"Investimenti 2019: Soluzioni di Internet delle cose o IoT (ad es. Rfid, sensori, oggetti conne",
"Nessun investimento 2018-2019: Soluzioni di Internet delle cose o IoT (ad es. Rfid, sensori, oggetti conne",
"Investimenti 2018: Stampa 3D",
"Investimenti 2019: Stampa 3D",
"Nessun investimento 2018-2019: Stampa 3D",
"Investimenti 2018: Robotica (robot industriali, robot collaborativi interconnessi e programmabili)",
"Investimenti 2019: Robotica (robot industriali, robot collaborativi interconnessi e programmabili)",
"Nessun investimento 2018-2019: Robotica (robot industriali, robot collaborativi interconnessi e programmabili)",
"Investimenti 2018: Altri beni strumentali computerizzati o gestiti tramite sensori e interconnessi con altri sistemi aziendali",
"Investimenti 2019: Altri beni strumentali computerizzati o gestiti tramite sensori e interconnessi con altri sistemi aziendali",
"Nessun investimento 2018-2019: Altri beni strumentali computerizzati o gestiti tramite sensori e interconnessi con altri sistemi aziendali",
"Investimenti 2018: Cloud Computing (insieme di servizi informatici utilizzabili tramite Internet che consentono l'accesso a software, potenza di calcolo, capacita' di memoria, ecc.)",
"Investimenti 2019: Cloud Computing (insieme di servizi informatici utilizzabili tramite Internet che consentono l'accesso a software, potenza di calcolo, capacita' di memoria, ecc.)",
"Nessun investimento 2018-2019: Cloud Computing (insieme di servizi informatici utilizzabili tramite Internet che consentono l'accesso a software, potenza di calcolo, capacita' di memoria, ecc.)",
"Investimenti 2018: Applicazioni web o app (applicazioni accessibili via Internet comprese quelle gestionali)",
"Investimenti 2019: Applicazioni web o app (applicazioni accessibili via Internet comprese quelle gestionali)",
"Nessun investimento 2018-2019: Applicazioni web o app (applicazioni accessibili via Internet comprese quelle gestionali)",
"Investimenti 2018: Vendite online",
"Investimenti 2019: Vendite online",
"Nessun investimento 2018-2019: Vendite online",
"Investimenti 2018: Big Data Analytics (uso di tecniche, tecnologie e software per l'analisi di grandi quantita' di dati)",
"Investimenti 2019: Big Data Analytics (uso di tecniche, tecnologie e software per l'analisi di grandi quantita' di dati)",
"Nessun investimento 2018-2019: Big Data Analytics (uso di tecniche, tecnologie e software per l'analisi di grandi quantita' di dati)",
"Investimenti 2018: Realta' aumentata e realta' virtuale",
"Investimenti 2019: Realta' aumentata e realta' virtuale",
"Nessun investimento 2018-2019: Realta' aumentata e realta' virtuale",
"Investimenti 2018: Sicurezza informatica",
"Investimenti 2019: Sicurezza informatica",
"Nessun investimento 2018-2019: Sicurezza informatica",
"Investimenti 2018: Altro",
"Investimenti 2019: Altro",
"Nessun investimento 2018-2019: Altro",
"Fattori digitalizzazione 2018-2019: Infrastruttura e connessione in banda ultralarga",
"Fattori digitalizzazione 2018-2019: Agevolazioni, finanziamenti, incentivi fiscali a sostegno della digitalizzazione",
"Fattori digitalizzazione 2018-2019: Iniziative digitali della pubblica amministrazione",
"Fattori digitalizzazione 2018-2019: Capacita' di fare rete attuando modelli di collaborazione con altre imprese e centri di ricerca per la digitalizzazio",
"Fattori digitalizzazione 2018-2019: Inserimento/sviluppo di nuove competenze digitali",
"Fattori digitalizzazione 2018-2019:Sviluppo/consolidamento di competenze di personale gia' esistente",
"Fattori digitalizzazione 2018-2019: Sviluppo di una strategia di digitalizzazione dell'impresa",
"Fattori digitalizzazione 2018-2019: Altro",
"Fattori digitalizzazione 2018-2019: Nessun fattore di digitalizzazione puo' incidere",
"Fattori digitalizzazione 2018-2019: Non so",
"Ateco, classificazione Ateco2007 a una lettera (contiene missing)",
"Macrosettore",
"Classe addetti",
"5 ripartizioni geografiche",
"Dominio relativo al settore ICT che comprende le seguenti attivita' economiche: 261+262+263+264+268+465+582+61+62+631+951",
"Peso da utilizzare per riporto all'universo",
"Classe percentuale degli ordini di vendita online")

names(varlab) <- colnames(DF_ICT_A2018)

###===== CASTING, FACTORING and CLEANING =====###

DF_ICT_A2018$ricavi_cl <- factor(as.numeric(DF_ICT_A2018$ricavi_cl), 
levels=c( 
0, 
20000, 
50000, 
100000, 
200000, 
500000, 
1000000, 
2000000, 
4000000, 
5000000, 
10000000, 
20000000, 
50000000, 
200000000), 
labels=c( 
"[0, 20k)", 
"[20k, 50k)", 
"[50k, 100k)", 
"[100k, 200k)", 
"[200k, 500k)", 
"[500k, 1m)", 
"[1m, 2m)", 
"[2m, 4m)", 
"[4m, 5m)", 
"[5m, 10m)", 
"[10m, 20m)", 
"[20m, 50m)", 
"[50m, 200m)", 
"[200m, + infinito)"), exclude=NULL) 

# check 
# prod((ricavi_cl_Fact == "missing per esigenze di anonimizzazione") == is.na(DF_ICT_A2018$ricavi_cl))


DF_ICT_A2018$B1 <- factor(DF_ICT_A2018$B1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$B2a <- factor(DF_ICT_A2018$B2a, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$B2b <- factor(DF_ICT_A2018$B2b, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$B3 <- factor(DF_ICT_A2018$B3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$B4 <- factor(DF_ICT_A2018$B4, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$B5a <- factor(DF_ICT_A2018$B5a, 
levels=c( 
1, 
2, 
3), 
labels=c( 
"interni", 
"esterni", 
"attivita' non svolta"), exclude=NULL) 


DF_ICT_A2018$B5b <- factor(DF_ICT_A2018$B5b, 
levels=c( 
1, 
2, 
3), 
labels=c( 
"interni", 
"esterni", 
"attivita' non svolta"), exclude=NULL) 


DF_ICT_A2018$B5c <- factor(DF_ICT_A2018$B5c, 
levels=c( 
1, 
2, 
3), 
labels=c( 
"interni", 
"esterni", 
"attivita' non svolta"), exclude=NULL) 


DF_ICT_A2018$B5d <- factor(DF_ICT_A2018$B5d, 
levels=c( 
1, 
2, 
3), 
labels=c( 
"interni", 
"esterni", 
"attivita' non svolta"), exclude=NULL) 


DF_ICT_A2018$B5e <- factor(DF_ICT_A2018$B5e, 
levels=c( 
1, 
2, 
3), 
labels=c( 
"interni", 
"esterni", 
"attivita' non svolta"), exclude=NULL) 


DF_ICT_A2018$B5f <- factor(DF_ICT_A2018$B5f, 
levels=c( 
1, 
2, 
3), 
labels=c( 
"interni", 
"esterni", 
"attivita' non svolta"), exclude=NULL) 


DF_ICT_A2018$B5g <- factor(DF_ICT_A2018$B5g, 
levels=c( 
1, 
2, 
3), 
labels=c( 
"interni", 
"esterni", 
"attivita' non svolta"), exclude=NULL) 


DF_ICT_A2018$C1 <- factor(DF_ICT_A2018$C1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$C3 <- factor(DF_ICT_A2018$C3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$C4 <- factor(DF_ICT_A2018$C4, 
levels=c( 
1, 
2, 
3, 
4, 
5), 
labels=c( 
"Inferiore a  2Mbit/s", 
"Compresa tra 2Mbit/s e meno di 10Mbit/s", 
"Compresa tra 10Mbit/s e meno di 30Mbit/s", 
"Compresa tra 30Mbit/s e meno di 100Mbit/s", 
"Maggiore o uguale a 100 Mbit/s"), exclude=NULL) 


DF_ICT_A2018$C5 <- factor(DF_ICT_A2018$C5, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$C7a <- factor(DF_ICT_A2018$C7a, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$C7b <- factor(DF_ICT_A2018$C7b, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C7c <- factor(DF_ICT_A2018$C7c, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C8 <- factor(DF_ICT_A2018$C8, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C9a <- factor(DF_ICT_A2018$C9a, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C9b <- factor(DF_ICT_A2018$C9b, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C9c <- factor(DF_ICT_A2018$C9c, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C9d <- factor(DF_ICT_A2018$C9d, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C9e <- factor(DF_ICT_A2018$C9e, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C9f <- factor(DF_ICT_A2018$C9f, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C10 <- factor(DF_ICT_A2018$C10, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C11a <- factor(DF_ICT_A2018$C11a, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C11b <- factor(DF_ICT_A2018$C11b, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C11c <- factor(DF_ICT_A2018$C11c, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C11d <- factor(DF_ICT_A2018$C11d, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12a1 <- factor(DF_ICT_A2018$C12a1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12a2 <- factor(DF_ICT_A2018$C12a2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12a3 <- factor(DF_ICT_A2018$C12a3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12a4 <- factor(DF_ICT_A2018$C12a4, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12a5 <- factor(DF_ICT_A2018$C12a5, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12a6 <- factor(DF_ICT_A2018$C12a6, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12a7 <- factor(DF_ICT_A2018$C12a7, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12b1 <- factor(DF_ICT_A2018$C12b1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12b2 <- factor(DF_ICT_A2018$C12b2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12b3 <- factor(DF_ICT_A2018$C12b3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12b4 <- factor(DF_ICT_A2018$C12b4, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12b5 <- factor(DF_ICT_A2018$C12b5, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12b6 <- factor(DF_ICT_A2018$C12b6, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12b7 <- factor(DF_ICT_A2018$C12b7, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12c1 <- factor(DF_ICT_A2018$C12c1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12c2 <- factor(DF_ICT_A2018$C12c2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12c3 <- factor(DF_ICT_A2018$C12c3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12c4 <- factor(DF_ICT_A2018$C12c4, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12c5 <- factor(DF_ICT_A2018$C12c5, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12c6 <- factor(DF_ICT_A2018$C12c6, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12c7 <- factor(DF_ICT_A2018$C12c7, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12d1 <- factor(DF_ICT_A2018$C12d1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12d2 <- factor(DF_ICT_A2018$C12d2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12d3 <- factor(DF_ICT_A2018$C12d3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12d4 <- factor(DF_ICT_A2018$C12d4, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12d5 <- factor(DF_ICT_A2018$C12d5, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12d6 <- factor(DF_ICT_A2018$C12d6, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12d7 <- factor(DF_ICT_A2018$C12d7, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12e1 <- factor(DF_ICT_A2018$C12e1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12e2 <- factor(DF_ICT_A2018$C12e2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12e3 <- factor(DF_ICT_A2018$C12e3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12e4 <- factor(DF_ICT_A2018$C12e4, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12e5 <- factor(DF_ICT_A2018$C12e5, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12e6 <- factor(DF_ICT_A2018$C12e6, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12e7 <- factor(DF_ICT_A2018$C12e7, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12f1 <- factor(DF_ICT_A2018$C12f1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12f2 <- factor(DF_ICT_A2018$C12f2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12f3 <- factor(DF_ICT_A2018$C12f3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12f4 <- factor(DF_ICT_A2018$C12f4, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12f5 <- factor(DF_ICT_A2018$C12f5, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12f6 <- factor(DF_ICT_A2018$C12f6, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12f7 <- factor(DF_ICT_A2018$C12f7, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12g1 <- factor(DF_ICT_A2018$C12g1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12g2 <- factor(DF_ICT_A2018$C12g2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12g3 <- factor(DF_ICT_A2018$C12g3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12g4 <- factor(DF_ICT_A2018$C12g4, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12g5 <- factor(DF_ICT_A2018$C12g5, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12g6 <- factor(DF_ICT_A2018$C12g6, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12g7 <- factor(DF_ICT_A2018$C12g7, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12h1 <- factor(DF_ICT_A2018$C12h1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12h2 <- factor(DF_ICT_A2018$C12h2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12h3 <- factor(DF_ICT_A2018$C12h3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12h4 <- factor(DF_ICT_A2018$C12h4, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12h5 <- factor(DF_ICT_A2018$C12h5, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12h6 <- factor(DF_ICT_A2018$C12h6, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12h7 <- factor(DF_ICT_A2018$C12h7, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12i1 <- factor(DF_ICT_A2018$C12i1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12i2 <- factor(DF_ICT_A2018$C12i2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12i3 <- factor(DF_ICT_A2018$C12i3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12i4 <- factor(DF_ICT_A2018$C12i4, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12i5 <- factor(DF_ICT_A2018$C12i5, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12i6 <- factor(DF_ICT_A2018$C12i6, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ C12i7 <- factor(DF_ICT_A2018$C12i7, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ D1 <- factor(DF_ICT_A2018$D1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ D2a <- factor(DF_ICT_A2018$D2a, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ D2b <- factor(DF_ICT_A2018$D2b, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ D2c <- factor(DF_ICT_A2018$D2c, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ D2d <- factor(DF_ICT_A2018$D2d, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ D2e <- factor(DF_ICT_A2018$D2e, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ D2f <- factor(DF_ICT_A2018$D2f, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ D2g <- factor(DF_ICT_A2018$D2g, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ D3a <- factor(DF_ICT_A2018$D3a, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ D3b <- factor(DF_ICT_A2018$D3b, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ E1a <- factor(DF_ICT_A2018$E1a, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ E1b <- factor(DF_ICT_A2018$E1b, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ E2a <- factor(DF_ICT_A2018$E2a, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ E2b <- factor(DF_ICT_A2018$E2b, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ E2c <- factor(DF_ICT_A2018$E2c, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ E2d <- factor(DF_ICT_A2018$E2d, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ F1a <- factor(DF_ICT_A2018$F1a, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ F1b <- factor(DF_ICT_A2018$F1b, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ F2a <- factor(DF_ICT_A2018$F2a, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ F2b <- factor(DF_ICT_A2018$F2b, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ F2c <- factor(DF_ICT_A2018$F2c, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ F2d <- factor(DF_ICT_A2018$F2d, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ F2e <- factor(DF_ICT_A2018$F2e, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ F2f <- factor(DF_ICT_A2018$F2f, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ F2g <- factor(DF_ICT_A2018$F2g, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ G1a <- factor(DF_ICT_A2018$G1a, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ G1b <- factor(DF_ICT_A2018$G1b, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ G1c <- factor(DF_ICT_A2018$G1c, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ G1d <- factor(DF_ICT_A2018$G1d, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ G2a <- factor(DF_ICT_A2018$G2a, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ G2b <- factor(DF_ICT_A2018$G2b, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ H1a <- factor(DF_ICT_A2018$H1a, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ H1b <- factor(DF_ICT_A2018$H1b, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ H1c <- factor(DF_ICT_A2018$H1c, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ H1d <- factor(DF_ICT_A2018$H1d, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ H2 <- factor(DF_ICT_A2018$H2, 
levels=c( 
1, 
2, 
3, 
4, 
5), 
labels=c( 
"inferiore a 10%", 
"tra 10% e meno di 25%", 
"tra 25% e meno di 50%", 
"tra 50% e meno di 75%", 
"almeno 75%"), exclude=NULL) 


DF_ICT_A2018$ I1a <- factor(DF_ICT_A2018$I1a, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ I1b <- factor(DF_ICT_A2018$I1b, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ I2_cl <- factor(DF_ICT_A2018$I2_cl, 
levels=c( 
0, 
1, 
2, 
5, 
10, 
25, 
50), 
labels=c(
"[0,1)", 
"[1,2)", 
"[2,5)", 
"[5,10)", 
"[10,25)", 
"[25,50)", 
"50, oltre 50)"), exclude=NULL) 


DF_ICT_A2018$ I5 <- factor(DF_ICT_A2018$I5, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ I6_cl <- factor(DF_ICT_A2018$I6_cl, 
levels=c( 
0, 
1, 
2, 
5, 
10, 
25, 
50), 
labels=c( 
"[0,1)", 
"[1,2)", 
"[2,5)", 
"[5,10)", 
"[10,25)", 
"[25,50)", 
"50, oltre 50)"), exclude=NULL) 


DF_ICT_A2018$ J1a1 <- factor(DF_ICT_A2018$J1a1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1a2 <- factor(DF_ICT_A2018$J1a2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1a3 <- factor(DF_ICT_A2018$J1a3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1b1 <- factor(DF_ICT_A2018$J1b1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1b2 <- factor(DF_ICT_A2018$J1b2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1b3 <- factor(DF_ICT_A2018$J1b3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1c1 <- factor(DF_ICT_A2018$J1c1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1c2 <- factor(DF_ICT_A2018$J1c2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1c3 <- factor(DF_ICT_A2018$J1c3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1d1 <- factor(DF_ICT_A2018$J1d1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1d2 <- factor(DF_ICT_A2018$J1d2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1d3 <- factor(DF_ICT_A2018$J1d3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1e1 <- factor(DF_ICT_A2018$J1e1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1e2 <- factor(DF_ICT_A2018$J1e2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1e3 <- factor(DF_ICT_A2018$J1e3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1f1 <- factor(DF_ICT_A2018$J1f1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1f2 <- factor(DF_ICT_A2018$J1f2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1f3 <- factor(DF_ICT_A2018$J1f3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1g1 <- factor(DF_ICT_A2018$J1g1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1g2 <- factor(DF_ICT_A2018$J1g2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1g3 <- factor(DF_ICT_A2018$J1g3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1h1 <- factor(DF_ICT_A2018$J1h1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1h2 <- factor(DF_ICT_A2018$J1h2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1h3 <- factor(DF_ICT_A2018$J1h3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1i1 <- factor(DF_ICT_A2018$J1i1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1i2 <- factor(DF_ICT_A2018$J1i2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1i3 <- factor(DF_ICT_A2018$J1i3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1j1 <- factor(DF_ICT_A2018$J1j1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1j2 <- factor(DF_ICT_A2018$J1j2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J1j3 <- factor(DF_ICT_A2018$J1j3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2a1 <- factor(DF_ICT_A2018$J2a1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2a2 <- factor(DF_ICT_A2018$J2a2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2a3 <- factor(DF_ICT_A2018$J2a3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2b1 <- factor(DF_ICT_A2018$J2b1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2b2 <- factor(DF_ICT_A2018$J2b2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2b3 <- factor(DF_ICT_A2018$J2b3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2c1 <- factor(DF_ICT_A2018$J2c1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2c2 <- factor(DF_ICT_A2018$J2c2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2c3 <- factor(DF_ICT_A2018$J2c3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2d1 <- factor(DF_ICT_A2018$J2d1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2d2 <- factor(DF_ICT_A2018$J2d2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2d3 <- factor(DF_ICT_A2018$J2d3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2e1 <- factor(DF_ICT_A2018$J2e1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2e2 <- factor(DF_ICT_A2018$J2e2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2e3 <- factor(DF_ICT_A2018$J2e3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2f1 <- factor(DF_ICT_A2018$J2f1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2f2 <- factor(DF_ICT_A2018$J2f2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2f3 <- factor(DF_ICT_A2018$J2f3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2g1 <- factor(DF_ICT_A2018$J2g1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2g2 <- factor(DF_ICT_A2018$J2g2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2g3 <- factor(DF_ICT_A2018$J2g3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2h1 <- factor(DF_ICT_A2018$J2h1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2h2 <- factor(DF_ICT_A2018$J2h2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2h3 <- factor(DF_ICT_A2018$J2h3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2i1 <- factor(DF_ICT_A2018$J2i1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2i2 <- factor(DF_ICT_A2018$J2i2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2i3 <- factor(DF_ICT_A2018$J2i3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2j1 <- factor(DF_ICT_A2018$J2j1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2j2 <- factor(DF_ICT_A2018$J2j2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2j3 <- factor(DF_ICT_A2018$J2j3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2k1 <- factor(DF_ICT_A2018$J2k1, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2k2 <- factor(DF_ICT_A2018$J2k2, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J2k3 <- factor(DF_ICT_A2018$J2k3, 
levels=c( 
0, 
1), 
labels=c( 
"no", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J3a <- factor(DF_ICT_A2018$J3a, 
levels=c( 
0, 
1), 
labels=c( 
"non scelto tra i tre possibili", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J3b <- factor(DF_ICT_A2018$J3b, 
levels=c( 
0, 
1), 
labels=c( 
"non scelto tra i tre possibili", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J3c <- factor(DF_ICT_A2018$J3c, 
levels=c( 
0, 
1), 
labels=c( 
"non scelto tra i tre possibili", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J3d <- factor(DF_ICT_A2018$J3d, 
levels=c( 
0, 
1), 
labels=c( 
"non scelto tra i tre possibili", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J3e <- factor(DF_ICT_A2018$J3e, 
levels=c( 
0, 
1), 
labels=c( 
"non scelto tra i tre possibili", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J3f <- factor(DF_ICT_A2018$J3f, 
levels=c( 
0, 
1), 
labels=c( 
"non scelto tra i tre possibili", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J3g <- factor(DF_ICT_A2018$J3g, 
levels=c( 
0, 
1), 
labels=c( 
"non scelto tra i tre possibili", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J3h <- factor(DF_ICT_A2018$J3h, 
levels=c( 
0, 
1), 
labels=c( 
"non scelto tra i tre possibili", 
"si"), exclude=NULL) 


DF_ICT_A2018$ J3i <- factor(DF_ICT_A2018$J3i, 
levels=c( 
0, 
1), 
labels=c( 
"non scelto tra i tre possibili", 
"Nessun fattore di digitalizzazione pu¿ incidere"), exclude=NULL) 

DF_ICT_A2018$ J3j <- factor(DF_ICT_A2018$J3j, 
levels=c( 
0, 
1), 
labels=c( 
"non scelto tra i tre possibili", 
"Non so"), exclude=NULL) 


DF_ICT_A2018$mac <- factor(DF_ICT_A2018$mac, 
levels=c("M1", 
"M2", 
"M3", 
"M4"), 
labels=c("MACROSETTORE MANIFATTURIERO", 
"MACROSETTORE ENERGIA", 
"MACROSETTORE COSTRUZIONI", 
"MACROSETTORE SERVIZI (NON FINANZIARI)")) 


DF_ICT_A2018$clad3 <- factor(DF_ICT_A2018$clad3, 
levels=c("cl1", 
"cl2", 
"cl3"), 
labels=c("10-49 addetti", 
"50-249 addetti", 
"250 e piu' addetti")) 


DF_ICT_A2018$rip <- factor(DF_ICT_A2018$rip, 
levels=c("ITC", 
"ITF", 
"ITG", 
"ITH", 
"ITI"), 
labels=c("nord-ovest", 
"sud", 
"isole", 
"nord-est", 
"centro")) 


DF_ICT_A2018$dom4 <- factor(DF_ICT_A2018$dom4, 
levels=c("NO_ICT", 
"SI_ICT", 
" "), 
labels=c("Non appartiene al Settore ICT", 
"Appartiene al settore ICT (Ateco 261, 262, 263, 264, 268, 465, 582, 61, 62, 631, 951)", 
"missing per esigenze di anonimizzazione")) 


DF_ICT_A2018$ I2I6_cl <- factor(DF_ICT_A2018$I2I6_cl, 
levels=c( 
0, 
1, 
2, 
5, 
10, 
25, 
50), 
labels=c(
"[0,1)", 
"[1,2)", 
"[2,5)", 
"[5,10)", 
"[10,25)", 
"[25,50)", 
"50, oltre 50)"), exclude=NULL) 

DF_ICT_A2018$Ateco_1[DF_ICT_A2018$Ateco_1 == " "] <- NA

DF_ICT_A2018$Ateco_1 <- factor(DF_ICT_A2018$Ateco_1, 
levels=c("C", "G", "D", "F", "M", "N", "I", "J", "E", "H", "L", "S"), 
labels=c("C", "G", "D", "F", "M", "N", "I", "J", "E", "H", "L", "S"),
exclude=NULL
)

DF_ICT_A2018$A3_ <- as.numeric(DF_ICT_A2018$A3_)
DF_ICT_A2018$C2_ <- as.numeric(DF_ICT_A2018$C2_)
DF_ICT_A2018$C6_ <- as.numeric(DF_ICT_A2018$C6_)
DF_ICT_A2018$I3a <- as.numeric(DF_ICT_A2018$I3a)
DF_ICT_A2018$I3b <- as.numeric(DF_ICT_A2018$I3b)
DF_ICT_A2018$I4a <- as.numeric(DF_ICT_A2018$I4a)
DF_ICT_A2018$I4b <- as.numeric(DF_ICT_A2018$I4b)


