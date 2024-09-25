import type { Struct, Schema } from '@strapi/strapi'

export interface AdSinglePage extends Struct.ComponentSchema {
    collectionName: 'components_ad_single_pages'
    info: {
        displayName: 'singlePage'
        icon: 'file'
    }
    attributes: {
        title: Schema.Attribute.String
        image: Schema.Attribute.Media<'images'> & Schema.Attribute.Required
    }
}

declare module '@strapi/strapi' {
    export module Public {
        export interface ComponentSchemas {
            'ad.single-page': AdSinglePage
        }
    }
}
