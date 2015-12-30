require 'ebay_ruby'

#http://developer.ebay.com/Devzone/finding/CallRef/indec.html
#Grading companies = BGS, PSA, BVG, BCCG, GAI, SGC
class EbayApiCall
    def find_by_keywords(keywords, grade_company)
		c=EbayConnect.new(EBAY_APP_ID_KEY)
		allCards = Array.new
		search_query = keywords + " " + grade_company
		results = c.find_items_by_keywords("#{search_query}", 100)
		results.each do |c|
			singleCard = Hash.new
			#itemId
			singleCard['itemId'] = c.itemId[0].to_i
			#title
			singleCard['title'] = c.title[0].to_s
			#graded company in title
			graded_q = (c.title[0].upcase.include? grade_company.upcase)
			if graded_q == true
				singleCard['gradeCompany'] = grade_company.upcase.to_s
			else
				singleCard['gradeCompany'] = "No_grade_company"
			end
			#category info
			singleCard['categoryId'] =  c.primaryCategory[0]['categoryId'][0].to_i
			singleCard['categoryName'] =  c.primaryCategory[0]['categoryName'][0].to_s
			#price (currency) converted to USD
			singleCard['currency'] =  c.sellingStatus[0]['convertedCurrentPrice'][0]['@currencyId'].to_s
			#price (value) converted to USD
			singleCard['price'] =  c.sellingStatus[0]['convertedCurrentPrice'][0]['__value__'][0].to_i
			#number of bids
			singleCard['numberBids'] =  c.sellingStatus[0]['bidCount'][0].to_i if c.sellingStatus[0]['bidCount'] != nil
			#current status ('active' or...)
			singleCard['sellingState'] =  c.sellingStatus[0]['sellingState'][0].to_s
			#auction start date and time
			singleCard['startTime'] =  c.listingInfo[0]['startTime']
			#auction end date and time
			singleCard['endTime'] =  c.listingInfo[0]['endTime']
			#listing type (e.g. Auction, StoreInventory)
			singleCard['listingType'] =  c.listingInfo[0]['listingType'][0].to_s
			#url to ebay page
			singleCard['url'] =  c.viewItemURL[0].to_s
			#url to image
			singleCard['imageUrl'] =  c.galleryURL[0].to_s
			#condition if available
			begin
				singleCard['conditionId'] =  c.condition[0]['conditionId'][0].to_i
				singleCard['conditionDisplayName'] =  c.condition[0]['conditionDisplayName'][0].to_s
			rescue
				singleCard['conditionId'] = nil
				singleCard['conditionDisplayName'] =  "No_condition_data"
			end
			# card = Card.new(singleCard)
			# card.save
			allCards.push(singleCard)
		end
		return allCards
	end
end