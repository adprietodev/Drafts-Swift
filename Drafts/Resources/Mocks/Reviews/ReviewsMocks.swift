//
//  ReviewsMocks.swift
//  Drafts
//
//  Created by Adrián Prieto Villena on 5/6/25.
//  Copyright © 2025 Rudo Apps. All rights reserved.
//

import Foundation

extension Review {
    static func createMockReviews() -> [Review] {
            let productIds = ["PROD-001", "PROD-002", "PROD-003", "PROD-004", "PROD-005"]

            return [
                Review(
                    title: "¡Increíble calidad!",
                    content: "Estoy absolutamente encantado con esta compra. La calidad de construcción es excepcional y supera todas mis expectativas. El diseño es elegante y funcional. Definitivamente vale cada euro invertido. Lo recomiendo sin dudarlo.",
                    rating: 5,
                    productId: productIds[0],
                    authorName: "María González",
                    imagePath: nil,
                    imageData: MockImageGenerator.generateMockImageData(color: .systemGreen, name: productIds[0]),
                    isRecommended: true,
                    tags: ["excelente", "calidad", "recomendado", "diseño"]
                ),

                Review(
                    title: "Buena relación calidad-precio",
                    content: "El producto cumple con lo prometido. No es perfecto, pero por el precio que tiene está muy bien. La entrega fue rápida y el empaquetado cuidadoso. Algunas características podrían mejorarse, pero en general estoy satisfecho.",
                    rating: 4,
                    productId: productIds[1],
                    authorName: "Carlos Martín",
                    imagePath: "reviews/review_2.jpg",
                    imageData: MockImageGenerator.generateMockImageData(color: .systemOrange, name: productIds[1]),
                    isRecommended: true,
                    tags: ["precio", "satisfecho", "entrega", "mejorable"]
                ),

                Review(
                    title: "No cumplió mis expectativas",
                    content: "Esperaba más de este producto basándome en las reseñas anteriores. La calidad de los materiales no es la que esperaba y tiene algunos defectos menores. El servicio al cliente fue bueno, pero el producto en sí me decepcionó un poco.",
                    rating: 2,
                    productId: productIds[2],
                    authorName: "Ana López",
                    imagePath: nil,
                    imageData: MockImageGenerator.generateMockImageData(color: .systemOrange, name: productIds[2]),
                    isRecommended: false,
                    tags: ["decepcionante", "defectos", "materiales", "expectativas"]
                ),

                Review(
                    title: "Producto correcto",
                    content: "Es un producto estándar que hace lo que debe hacer. No destaca especialmente pero tampoco tiene grandes fallos. La instalación fue sencilla y funciona según lo esperado. Para el uso que le doy está bien.",
                    rating: 3,
                    productId: productIds[3],
                    authorName: "Pedro Rodríguez",
                    imagePath: nil,
                    imageData: MockImageGenerator.generateMockImageData(color: .systemYellow, name: productIds[3]),
                    isRecommended: false,
                    tags: ["estándar", "funcional", "correcto", "básico"]
                ),

                Review(
                    title: "¡Perfecto para mi uso!",
                    content: "Justo lo que necesitaba. Se adapta perfectamente a mis necesidades diarias y la experiencia de uso es muy fluida. La duración de la batería es excelente y el rendimiento supera mis expectativas. Compra muy acertada.",
                    rating: 5,
                    productId: productIds[4],
                    authorName: "Laura Fernández",
                    imagePath: nil,
                    imageData: MockImageGenerator.generateMockImageData(color: .systemPink, name: productIds[4]),
                    isRecommended: true,
                    tags: ["perfecto", "necesidades", "batería", "rendimiento", "acertada"]
                )
            ]
        }

        static func randomMockReview() -> Review {
            return createMockReviews().randomElement() ?? createMockReviews().first!
        }
}
