package com.example.spring_boot_ticket_vol.service;

import com.example.spring_boot_ticket_vol.entity.Reservation;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.io.ByteArrayOutputStream;
import java.time.format.DateTimeFormatter;
import java.net.URL;

@Service
@RequiredArgsConstructor
public class PDFService {
    private final ReservationService reservationService;

    // Palette de couleurs moderne et professionnelle
    private static final BaseColor PRIMARY_COLOR = new BaseColor(41, 128, 185); // Bleu professionnel
    private static final BaseColor SECONDARY_COLOR = new BaseColor(52, 73, 94); // Gris foncé élégant
    private static final BaseColor ACCENT_COLOR = new BaseColor(39, 174, 96); // Vert émeraude
    private static final BaseColor LIGHT_BG = new BaseColor(245, 247, 250); // Fond gris clair
    private static final BaseColor HIGHLIGHT = new BaseColor(243, 156, 18); // Orange pour mise en évidence

    // Polices personnalisées
    private static Font TITLE_FONT;
    private static Font SUBTITLE_FONT;
    private static Font SECTION_FONT;
    private static Font VALUE_FONT;
    private static Font PRICE_FONT;
    private static Font FOOTER_FONT;

    public byte[] generateReservationPDF(Integer reservationId) throws DocumentException {
        Document document = new Document(PageSize.A4, 45, 45, 45, 45); // Marges plus importantes pour un look élégant
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        try {
            PdfWriter writer = PdfWriter.getInstance(document, out);
            document.open();
            
            // Initialisation des polices
            initializeFonts();
            
            // Ajout d'un filigrane subtil
            addWatermark(writer);
            
            // En-tête avec logo et titre
            addHeader(document);
            
            // Récupération des données de réservation
            Reservation reservation = reservationService.getReservationById(reservationId);
            
            // Informations de référence
            addReferenceInfo(document, reservation);
            
            // Informations client
            addClientInfo(document, reservation);
            
            // Informations du vol
            addFlightInfo(document, reservation);
            
            // Détails des places
            addSeatsInfo(document, reservation);
            
            // Prix total dans un cadre spécial
            addPriceInfo(document, reservation);
            
            // // Code QR
            // addQRCode(document, reservation);
            
            // Pied de page avec mentions légales
            addFooter(document);

            document.close();
            return out.toByteArray();
        } catch (Exception e) {
            throw new DocumentException("Erreur lors de la génération du PDF: " + e.getMessage());
        }
    }
    
    private void initializeFonts() {
        TITLE_FONT = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 24, PRIMARY_COLOR);
        SUBTITLE_FONT = FontFactory.getFont(FontFactory.HELVETICA, 12, SECONDARY_COLOR);
        SECTION_FONT = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10, PRIMARY_COLOR);
        VALUE_FONT = FontFactory.getFont(FontFactory.HELVETICA, 10, SECONDARY_COLOR);
        PRICE_FONT = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14, ACCENT_COLOR);
        FOOTER_FONT = FontFactory.getFont(FontFactory.HELVETICA_OBLIQUE, 6, SECONDARY_COLOR);
    }
    
    private void addWatermark(PdfWriter writer) {
        // Ajouter un filigrane subtil sur chaque page
        Rectangle pageSize = writer.getPageSize();
        try {
            PdfContentByte under = writer.getDirectContentUnder();
            under.saveState();
            PdfGState state = new PdfGState();
            state.setFillOpacity(0.07f);
            under.setGState(state);
            under.setColorFill(PRIMARY_COLOR);
            
            // Logo en filigrane au centre
            under.beginText();
            BaseFont baseFont = BaseFont.createFont(BaseFont.HELVETICA_BOLD, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            under.setFontAndSize(baseFont, 50);
            String watermark = "RESERVATION";
            float textWidth = baseFont.getWidthPoint(watermark, 60);
            under.showTextAligned(Element.ALIGN_CENTER, watermark, 
                    (pageSize.getLeft() + pageSize.getRight()) / 2, 
                    (pageSize.getTop() + pageSize.getBottom()) / 2, 45);
            under.endText();
            
            under.restoreState();
        } catch (Exception e) {
            // Gérer l'exception
        }
    }
    
    private void addHeader(Document document) throws DocumentException {
        // Bannière supérieure
        PdfPTable header = new PdfPTable(2);
        header.setWidthPercentage(100);
        header.setWidths(new float[]{1, 3});
        header.setSpacingAfter(25);
        
        // Cellule pour le logo (à gauche)
        PdfPCell logoCell = new PdfPCell();
        logoCell.setBorder(Rectangle.NO_BORDER);
        logoCell.setPadding(8);
        logoCell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
        try {
            // Placeholder pour un logo (à remplacer par votre logo réel)
            Image logo = Image.getInstance(new URL("https://via.placeholder.com/100x50"));
            logo.scaleToFit(75, 25);
            logoCell.addElement(logo);
        } catch (Exception e) {
            // Si le logo ne peut pas être chargé, utiliser un texte
            Paragraph logoText = new Paragraph("AIR TRACK", TITLE_FONT);
            logoCell.addElement(logoText);
        }
        
        // Cellule pour le titre (à droite)
        PdfPCell titleCell = new PdfPCell();
        titleCell.setBorder(Rectangle.NO_BORDER);
        titleCell.setPadding(8);
        titleCell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        titleCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        
        Paragraph title = new Paragraph("BILLET DE RÉSERVATION", TITLE_FONT);
        title.setAlignment(Element.ALIGN_RIGHT);
        titleCell.addElement(title);
        
        Paragraph subtitle = new Paragraph("Votre voyage commence ici", SUBTITLE_FONT);
        subtitle.setAlignment(Element.ALIGN_RIGHT);
        titleCell.addElement(subtitle);
        
        header.addCell(logoCell);
        header.addCell(titleCell);
        
        // Ajouter une ligne séparatrice élégante
        PdfPTable separator = new PdfPTable(1);
        separator.setWidthPercentage(100);
        separator.setSpacingAfter(20);
        
        PdfPCell separatorCell = new PdfPCell();
        separatorCell.setBorderWidthBottom(2);
        separatorCell.setBorderWidthTop(0);
        separatorCell.setBorderWidthLeft(0);
        separatorCell.setBorderWidthRight(0);
        separatorCell.setBorderColorBottom(PRIMARY_COLOR);
        separatorCell.setFixedHeight(2f);
        separatorCell.setPaddingBottom(10);
        separator.addCell(separatorCell);
        
        document.add(header);
        document.add(separator);
    }
    
    private void addReferenceInfo(Document document, Reservation reservation) throws DocumentException {
        Paragraph refPara = new Paragraph();
        Chunk refLabel = new Chunk("RÉFÉRENCE: ", SECTION_FONT);
        Chunk refValue = new Chunk(String.format("RES-%06d", reservation.getId()), FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14, HIGHLIGHT));
        refPara.add(refLabel);
        refPara.add(refValue);
        refPara.setAlignment(Element.ALIGN_RIGHT);
        document.add(refPara);
        
        document.add(Chunk.NEWLINE);
    }
    
    private void addClientInfo(Document document, Reservation reservation) throws DocumentException {
        PdfPTable clientTable = new PdfPTable(1);
        clientTable.setWidthPercentage(100);
        clientTable.setSpacingAfter(20);
        
        PdfPCell clientCell = new PdfPCell();
        clientCell.setBackgroundColor(LIGHT_BG);
        clientCell.setPadding(12);
        clientCell.setBorderColor(PRIMARY_COLOR);
        clientCell.setBorderWidth(1);
        
        Paragraph clientTitle = new Paragraph("INFORMATIONS PASSAGER", SECTION_FONT);
        clientTitle.setSpacingAfter(8);
        clientCell.addElement(clientTitle);
        
        Paragraph clientName = new Paragraph(reservation.getUtilisateur().getNom().toUpperCase() + " " + 
                                           reservation.getUtilisateur().getPrenom(), 
                                           FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14, SECONDARY_COLOR));
        clientName.setSpacingAfter(5);
        clientCell.addElement(clientName);
        
        // Ajoutez ici d'autres informations client si disponibles
        
        clientTable.addCell(clientCell);
        document.add(clientTable);
    }
    
    private void addFlightInfo(Document document, Reservation reservation) throws DocumentException {
        PdfPTable volTable = new PdfPTable(2);
        volTable.setWidthPercentage(100);
        volTable.setSpacingAfter(20);
        
        // Entête
        PdfPCell headerCell = new PdfPCell(new Paragraph("DÉTAILS DU VOL", SECTION_FONT));
        headerCell.setColspan(2);
        headerCell.setBackgroundColor(PRIMARY_COLOR);
        headerCell.setBorderColor(PRIMARY_COLOR);
        headerCell.setPadding(8);
        SECTION_FONT.setColor(BaseColor.WHITE);
        headerCell.addElement(new Paragraph("DÉTAILS DU VOL", SECTION_FONT));
        SECTION_FONT.setColor(PRIMARY_COLOR); // Restaurer la couleur d'origine
        volTable.addCell(headerCell);
        
        // Villes de départ et d'arrivée avec une mise en page attrayante
        PdfPCell departCell = new PdfPCell();
        departCell.setPadding(12);
        departCell.setBorderWidth(0);
        
        Paragraph departInfo = new Paragraph();
        departInfo.add(new Chunk("DÉPART\n", FontFactory.getFont(FontFactory.HELVETICA, 10, SECONDARY_COLOR)));
        departInfo.add(new Chunk(reservation.getPlaceVol().getVol().getVilleDepart().getNom().toUpperCase() + "\n", 
                      FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18, PRIMARY_COLOR)));
        
        DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("dd MMM yyyy");
        DateTimeFormatter formatterTime = DateTimeFormatter.ofPattern("HH:mm");
        String dateDepart = reservation.getPlaceVol().getVol().getDateDepart().format(formatterDate);
        String heureDepart = reservation.getPlaceVol().getVol().getDateDepart().format(formatterTime);
        
        departInfo.add(new Chunk(dateDepart + "\n", FontFactory.getFont(FontFactory.HELVETICA, 12, SECONDARY_COLOR)));
        departInfo.add(new Chunk(heureDepart, FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16, HIGHLIGHT)));
        
        departCell.addElement(departInfo);
        volTable.addCell(departCell);
        
        // Arrivée
        PdfPCell arriveeCell = new PdfPCell();
        arriveeCell.setPadding(12);
        arriveeCell.setBorderWidth(0);
        
        Paragraph arriveeInfo = new Paragraph();
        arriveeInfo.add(new Chunk("ARRIVÉE\n", FontFactory.getFont(FontFactory.HELVETICA, 10, SECONDARY_COLOR)));
        arriveeInfo.add(new Chunk(reservation.getPlaceVol().getVol().getVilleArrive().getNom().toUpperCase() + "\n", 
                       FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18, PRIMARY_COLOR)));
        
        // Supposons que nous avons aussi une date d'arrivée (sinon utilisez dateDepart comme fallback)
        arriveeInfo.add(new Chunk(dateDepart + "\n", FontFactory.getFont(FontFactory.HELVETICA, 12, SECONDARY_COLOR)));
        arriveeInfo.add(new Chunk("--:--", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16, HIGHLIGHT)));
        
        arriveeCell.addElement(arriveeInfo);
        volTable.addCell(arriveeCell);
        
        document.add(volTable);
    }
    
    private void addSeatsInfo(Document document, Reservation reservation) throws DocumentException {
        PdfPTable seatsTable = new PdfPTable(2);
        seatsTable.setWidthPercentage(100);
        seatsTable.setSpacingAfter(20);
        
        // Entête
        PdfPCell headerCell = new PdfPCell();
        headerCell.setColspan(2);
        headerCell.setBorderColor(ACCENT_COLOR);
        headerCell.setBorderWidth(1);
        headerCell.setPadding(8);
        headerCell.addElement(new Paragraph("DÉTAILS DES PLACES", SECTION_FONT));
        seatsTable.addCell(headerCell);
        
        // Contenu avec style alterné pour une meilleure lisibilité
        addTableRowStyled(seatsTable, "Type de siège", reservation.getPlaceVol().getPlace().getTypeSiege().getDesignation(), true);
        addTableRowStyled(seatsTable, "Nombre de places", String.valueOf(reservation.getNbPlaces()), false);
        addTableRowStyled(seatsTable, "Adultes", String.valueOf(reservation.getNbAdulte()), true);
        addTableRowStyled(seatsTable, "Enfants", String.valueOf(reservation.getNbEnfant()), false);
        
        document.add(seatsTable);
    }
    
    private void addTableRowStyled(PdfPTable table, String label, String value, boolean alternate) {
        BaseColor bgColor = alternate ? LIGHT_BG : BaseColor.WHITE;
        
        PdfPCell labelCell = new PdfPCell(new Phrase(label, SECTION_FONT));
        labelCell.setBorderWidth(0);
        labelCell.setPadding(8);
        labelCell.setBackgroundColor(bgColor);
        
        PdfPCell valueCell = new PdfPCell(new Phrase(value, VALUE_FONT));
        valueCell.setBorderWidth(0);
        valueCell.setPadding(8);
        valueCell.setBackgroundColor(bgColor);
        valueCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        
        table.addCell(labelCell);
        table.addCell(valueCell);
    }
    
    private void addPriceInfo(Document document, Reservation reservation) throws DocumentException {
        PdfPTable prixTable = new PdfPTable(1);
        prixTable.setWidthPercentage(100);
        prixTable.setSpacingAfter(20);
        
        // Cellule avec design premium
        PdfPCell prixCell = new PdfPCell();
        prixCell.setPadding(15);
        prixCell.setBackgroundColor(ACCENT_COLOR);
        
        Phrase prixPhrase = new Phrase();
        prixPhrase.add(new Chunk("PRIX TOTAL: ", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16, BaseColor.WHITE)));
        prixPhrase.add(new Chunk(String.format("%.2f €", reservation.getPrix()), 
                      FontFactory.getFont(FontFactory.HELVETICA_BOLD, 20, BaseColor.WHITE)));
        
        prixCell.setPhrase(prixPhrase);
        prixCell.setHorizontalAlignment(Element.ALIGN_CENTER);
        prixTable.addCell(prixCell);
        
        document.add(prixTable);
    }
    
    private void addQRCode(Document document, Reservation reservation) throws DocumentException {
        try {
            // Générer le contenu du QR code (infos de réservation)
            String qrContent = "RES:" + reservation.getId() + 
                           "|VOL:" + reservation.getPlaceVol().getVol().getId() +
                           "|CLIENT:" + reservation.getUtilisateur().getId();
            
            // Créer un QR code (utiliser une bibliothèque de génération de QR code)
            // Ici, nous utilisons un placeholder
            PdfPTable qrTable = new PdfPTable(2);
            qrTable.setWidthPercentage(60);
            qrTable.setHorizontalAlignment(Element.ALIGN_RIGHT);
            qrTable.setSpacingAfter(20);
            
            PdfPCell qrCell = new PdfPCell();
            qrCell.setBorder(Rectangle.NO_BORDER);
            qrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
            qrCell.setPadding(5);
            
            Paragraph qrInfo = new Paragraph("EMBARQUEMENT", SECTION_FONT);
            qrInfo.setAlignment(Element.ALIGN_CENTER);
            qrCell.addElement(qrInfo);
            
            // Placeholder pour un QR code
            Paragraph qrPlaceholder = new Paragraph("[QR CODE]", 
                                     FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14, SECONDARY_COLOR));
            qrPlaceholder.setAlignment(Element.ALIGN_CENTER);
            qrCell.addElement(qrPlaceholder);
            
            qrTable.addCell(qrCell);
            
            PdfPCell infoCell = new PdfPCell();
            infoCell.setBorder(Rectangle.NO_BORDER);
            
            Paragraph scanInfo = new Paragraph("Scannez ce code à l'embarquement", VALUE_FONT);
            infoCell.addElement(scanInfo);
            
            qrTable.addCell(infoCell);
            
            document.add(qrTable);
        } catch (Exception e) {
            // Gérer l'exception
        }
    }
    
    private void addFooter(Document document) throws DocumentException {
        // Séparateur
        PdfPTable separator = new PdfPTable(1);
        separator.setWidthPercentage(100);
        separator.setSpacingBefore(10);
        
        PdfPCell separatorCell = new PdfPCell();
        separatorCell.setBorderWidthBottom(1);
        separatorCell.setBorderWidthTop(0);
        separatorCell.setBorderWidthLeft(0);
        separatorCell.setBorderWidthRight(0);
        separatorCell.setBorderColorBottom(SECONDARY_COLOR);
        separatorCell.setFixedHeight(1f);
        separator.addCell(separatorCell);
        
        document.add(separator);
        
        // Mentions légales
        Paragraph footer = new Paragraph();
        footer.add(new Chunk(
                "Ce billet est personnel et non cessible. Veuillez vous présenter 2 heures avant le départ pour les formalités d'embarquement.\n" +
                "Pour toute question ou modification, veuillez contacter notre service client au +33 1 23 45 67 89.",
                FOOTER_FONT));
        footer.setAlignment(Element.ALIGN_CENTER);
        footer.setSpacingBefore(10);
        document.add(footer);
    }
}