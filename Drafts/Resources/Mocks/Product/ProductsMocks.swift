//
//  ProductsMocks.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

extension Product {
    static func createMockProducts() -> [Product] {
            return [
                Product(
                    name: "iPhone 15 Pro",
                    description: "El último smartphone de Apple con chip A17 Pro, cámara de 48MP y pantalla Super Retina XDR de 6.1 pulgadas. Disponible en titanio natural.",
                    price: 1199.00,
                    category: "Smartphones",
                    brand: "Apple",
                    imagePath: nil,
                    imageData: MockImageGenerator.generateMockImageData(color: .systemBlue, name: "Apple"),
                    isAvailable: true,
                    stockQuantity: 25
                ),

                Product(
                    name: "MacBook Air M2",
                    description: "Portátil ultraligero con chip M2, pantalla Liquid Retina de 13 pulgadas, hasta 18 horas de batería y diseño sin ventilador.",
                    price: 1249.00,
                    category: "Portátiles",
                    brand: "Apple",
                    imagePath: nil,
                    imageData: MockImageGenerator.generateMockImageData(color: .systemGray, name: "Apple"),
                    isAvailable: true,
                    stockQuantity: 15
                ),

                Product(
                    name: "Samsung Galaxy S24 Ultra",
                    description: "Smartphone Android flagship con S Pen integrado, cámara de 200MP, pantalla Dynamic AMOLED 2X de 6.8 pulgadas y 5G.",
                    price: 1299.00,
                    category: "Smartphones",
                    brand: "Samsung",
                    imagePath: nil,
                    imageData: MockImageGenerator.generateMockImageData(color: .systemPurple, name: "Samsung"),
                    isAvailable: true,
                    stockQuantity: 30
                ),

                Product(
                    name: "Sony WH-1000XM5",
                    description: "Auriculares inalámbricos premium con cancelación de ruido líder en la industria, 30 horas de batería y sonido Hi-Res.",
                    price: 399.99,
                    category: "Audio",
                    brand: "Sony",
                    imagePath: nil,
                    imageData: MockImageGenerator.generateMockImageData(color: .black, name: "Sony"),
                    isAvailable: true,
                    stockQuantity: 45
                ),

                Product(
                    name: "Dell XPS 13 Plus",
                    description: "Ultrabook premium con procesador Intel Core i7 de 12ª gen, pantalla InfinityEdge 4K+ y diseño minimalista sin bordes.",
                    price: 1599.00,
                    category: "Portátiles",
                    brand: "Dell",
                    imagePath: nil,
                    imageData: MockImageGenerator.generateMockImageData(color: .systemIndigo, name: "Sony"),
                    isAvailable: false,
                    stockQuantity: 0
                ),

                Product(
                    name: "Nintendo Switch OLED",
                    description: "Consola híbrida con pantalla OLED de 7 pulgadas, audio mejorado, base con puerto LAN y 64GB de almacenamiento interno.",
                    price: 349.99,
                    category: "Gaming",
                    brand: "Nintendo",
                    imagePath: nil,
                    imageData: MockImageGenerator.generateMockImageData(color: .systemRed, name: "Nintendo"),
                    isAvailable: true,
                    stockQuantity: 60
                ),

                Product(
                    name: "Logitech MX Master 3S",
                    description: "Ratón inalámbrico para productividad con sensor de 8000 DPI, scroll electromagnético y hasta 70 días de batería.",
                    price: 99.99,
                    category: "Accesorios",
                    brand: "Logitech",
                    imagePath: nil,
                    imageData: MockImageGenerator.generateMockImageData(color: .systemRed, name: "Logitech"),
                    isAvailable: true,
                    stockQuantity: 120
                ),

                Product(
                    name: "iPad Pro 12.9\" M2",
                    description: "Tablet profesional con chip M2, pantalla Liquid Retina XDR de 12.9 pulgadas, compatible con Apple Pencil y Magic Keyboard.",
                    price: 1099.00,
                    category: "Tablets",
                    brand: "Apple",
                    imagePath: nil,
                    imageData: MockImageGenerator.generateMockImageData(color: .systemTeal, name: "Apple"),
                    isAvailable: true,
                    stockQuantity: 20
                )
            ]
        }

        static func randomMockProduct() -> Product {
            return createMockProducts().randomElement() ?? createMockProducts().first!
        }
}
