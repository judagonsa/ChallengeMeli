//
//  ProductModel.swift
//  ChallengeLibre
//
//  Created by Julian González on 4/06/22.
//

import Foundation

class ProductModel {
    
    struct Data: Codable {
        let success: Bool?
        let message: String?
        let data: [dataModel]?
        
        enum codingKeys: String, CodingKey {
            case success = "success"
            case message = "message"
            case data = "results"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: codingKeys.self)
            success = try values.decodeIfPresent(Bool.self, forKey: .success)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            data = try values.decodeIfPresent([dataModel].self, forKey: .data)
        }
        
    }
    
    struct dataModel: Codable {
        let paging: pagingData?
        let id: String?
        let siteId: String?
        let title: String?
        let price: Int?
        let prices: [pricesData]?
        let salePrice: Int?
        let currencyId: String?
        let availableQuantity: Int?
        let soldQuantity: Int?
        let condition: String?
        let acceptsMercadopago: Bool?
        let installments: installmentsData?
        let shipping: shippingData?
        let imageListProduct: String?
        
        enum codingKeys: String, CodingKey {
            case paging = "paging"
            case id = "id"
            case siteId = "site_id"
            case title = "title"
            case price = "price"
            case prices = "prices"
            case salePrice = "sale_price"
            case currencyId = "currency_id"
            case availableQuantity = "available_quantity"
            case soldQuantity = "sold_quantity"
            case condition = "condition"
            case acceptsMercadopago = "accepts_mercadopago"
            case installments = "installments"
            case shipping = "shipping"
            case imageListProduct = "thumbnail"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: codingKeys.self)
            do {
                paging = try values.decodeIfPresent(pagingData.self, forKey: .paging)
            } catch {
                paging = nil
            }
            
            id = try values.decodeIfPresent(String.self, forKey: .id)
            siteId = try values.decodeIfPresent(String.self, forKey: .siteId)
            title = try values.decodeIfPresent(String.self, forKey: .title)
            price = try values.decodeIfPresent(Int.self, forKey: .price)
            prices = try values.decodeIfPresent([pricesData].self, forKey: .prices)
            
            do {
                salePrice = try values.decodeIfPresent(Int.self, forKey: .salePrice)
            } catch {
                salePrice = -1
            }
            
            currencyId = try values.decodeIfPresent(String.self, forKey: .currencyId)
            availableQuantity = try values.decodeIfPresent(Int.self, forKey: .availableQuantity)
            soldQuantity = try values.decodeIfPresent(Int.self, forKey: .soldQuantity)
            condition = try values.decodeIfPresent(String.self, forKey: .condition)
            acceptsMercadopago = try values.decodeIfPresent(Bool.self, forKey: .acceptsMercadopago)
            
            
            do {
                installments = try values.decodeIfPresent(installmentsData.self, forKey: .installments)
            } catch {
                installments = nil
            }
            
            shipping = try values.decodeIfPresent(shippingData.self, forKey: .shipping)
            imageListProduct = try values.decodeIfPresent(String.self, forKey: .imageListProduct)
        }
    }
    
    struct pagingData: Codable {
        let total: Int?
        let primaryResult: Int?
        let offset: Int?
        let limit: Int?
        
        enum codingKeys: String, CodingKey {
            case total = "total"
            case primaryResult = "primary_result"
            case offset = "offset"
            case limit = "limit"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: codingKeys.self)
            total = try values.decodeIfPresent(Int.self, forKey: .total)
            primaryResult = try values.decodeIfPresent(Int.self, forKey: .primaryResult)
            offset = try values.decodeIfPresent(Int.self, forKey: .offset)
            limit = try values.decodeIfPresent(Int.self, forKey: .limit)
        }
    }
    
    struct pricesData: Codable {
        let id: String?
        let type: String?
        let amount: Int?
        let regularAmount: Int?
        let currencyId: String?
        let metadata: metadataData?
    
        enum codingKeys: String, CodingKey {
            case id = "id"
            case type = "type"
            case amount = "amount"
            case regularAmount = "regular_amount"
            case currencyId = "currency_id"
            case metadata = "metadata"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: codingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            type = try values.decodeIfPresent(String.self, forKey: .type)
            amount = try values.decodeIfPresent(Int.self, forKey: .amount)
            regularAmount = try values.decodeIfPresent(Int.self, forKey: .regularAmount)
            currencyId = try values.decodeIfPresent(String.self, forKey: .currencyId)
            metadata = try values.decodeIfPresent(metadataData.self, forKey: .metadata)
        }
        
    }
    
    struct metadataData: Codable {
        let campaignDiscountPercentage: Double?
    
        enum codingKeys: String, CodingKey {
            case campaignDiscountPercentage = "campaign_discount_percentage"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: codingKeys.self)
            campaignDiscountPercentage = try values.decodeIfPresent(Double.self, forKey: .campaignDiscountPercentage)
        }
        
    }
    
    struct installmentsData: Codable {
        let quantity: Int?
        let amount: Double?
        let rate: Double?
        let currencyId: String?
        
        enum codingKeys: String, CodingKey {
            case quantity = "quantity"
            case amount = "amount"
            case rate = "rate"
            case currencyId = "currency_id"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: codingKeys.self)
            quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
            amount = try values.decodeIfPresent(Double.self, forKey: .amount)
            rate = try values.decodeIfPresent(Double.self, forKey: .rate)
            currencyId = try values.decodeIfPresent(String.self, forKey: .currencyId)
        }
    }
    
    struct shippingData: Codable {
        let freeShipping: Bool?
    
        enum codingKeys: String, CodingKey {
            case freeShipping = "free_shipping"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: codingKeys.self)
            freeShipping = try values.decodeIfPresent(Bool.self, forKey: .freeShipping)
        }
        
    }
    
}
